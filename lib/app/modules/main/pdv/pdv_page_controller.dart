import 'package:chess_pdv/app/core/excepition/fetch_exception.dart';
import 'package:chess_pdv/app/model/accommodation_item_removed_model.dart';
import 'package:chess_pdv/app/model/accommodation_model.dart';
import 'package:chess_pdv/app/model/pdv_model.dart';
import 'package:chess_pdv/app/model/product_model.dart';
import 'package:chess_pdv/app/model/product_pivot.dart';
import 'package:chess_pdv/app/model/room_exibhition_model.dart';
import 'package:chess_pdv/app/modules/main/pdv_store.dart';
import 'package:chess_pdv/app/services/product_service.dart';
import 'package:chess_pdv/app/services/room_service.dart';
import 'package:mobx/mobx.dart';
part 'pdv_page_controller.g.dart';

class PdvPageController = PdvPageControllerBase with _$PdvPageController;

abstract class PdvPageControllerBase with Store {
  final PdvStore _pdvStore;
  final ProductService _productService;
  final RoomService _roomService;

  PdvPageControllerBase({
    required PdvStore pdvStore,
    required ProductService productService,
    required RoomService roomService,
  })  : _pdvStore = pdvStore,
        _productService = productService,
        _roomService = roomService;

  @observable
  bool isLoading = false;

  @observable
  String error = '';

  @observable
  String success = '';

  @observable
  RoomExibhitionModel? selectedRoom;

  @computed
  PdvModel get pdv => _pdvStore.selectedPdv!;

  @observable
  List<String> guestAcommodation = [];

  @observable
  ObservableList<ProductModel> products = ObservableList<ProductModel>();

  @observable
  ObservableList<RoomExibhitionModel> roomBusy =
      ObservableList<RoomExibhitionModel>();

  @observable
  AccommodationModel? currentAccommodation;

  @observable
  bool showRoomGrid = true;

  @observable
  ObservableList<ProductModel> orderproducts = ObservableList<ProductModel>();

  @observable
  String titleProduct = '';

  @observable
  String titleVenda = 'Vendas';

  @computed
  double get totalValue => orderproducts.fold(
      0,
      (total, product) =>
          total + (product.salePrice * (product.pivot?.quantity ?? 1)));

  @observable
  bool showDeleteItemModal = false;

  @observable
  ProductModel? selectedProduct;

  

  @action
  Future<void> loadProducts() async {
    isLoading = true;
    try {
      products.clear();
      final productsList = await _productService.fetchAll();
      products.addAll(productsList);
    } on FetchException catch (e) {
      error = e.message ?? 'Error no servidor';
    } catch (e) {
      error = 'Error no servidor';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadRooms() async {
    isLoading = true;
    try {
      roomBusy.clear();
      final rooms = await _roomService.fetchBusyRooms();
      roomBusy.addAll(rooms);
    } on FetchException catch (e) {
      error = e.message ?? 'Error no servidor';
    } catch (e) {
      error = 'Error no servidor';
    } finally {
      isLoading = false;
    }
  }

  @action
  setCurrentAccommodation(RoomExibhitionModel room) async {
    isLoading = true;
    selectedRoom = room;
    titleProduct = 'Consumo do quarto ${room.description}';
    titleVenda = 'Vendas - Quarto ${room.description}';
    try {
      orderproducts.clear();
      currentAccommodation =
          await _roomService.currentAccommodation(room.currentAccommodationId);
      orderproducts.addAll(currentAccommodation?.product ?? []);
      showRoomGrid = false;
    } on FetchException catch (e) {
      error = e.message ?? 'Error no servidor';
    } catch (e) {
      error = 'Error no servidor';
    } finally {
      isLoading = false;
    }
  }

  load() async {
    guestAcommodation = _pdvStore.guestAcommodation;
    await Future.wait([loadProducts(), loadRooms()]);
  }

  @action
  clear() {
    isLoading = true;
    selectedRoom = null;
    currentAccommodation = null;
    orderproducts.clear();
    showRoomGrid = true;
    titleProduct = '';
    titleVenda = 'Vendas';
    isLoading = false;
  }

  @action
  setError(String value) => error = value;

  @action
  setSuccess(String value) => success = value;

  @action
  openDeleteItemModal(ProductModel product) {
    selectedProduct =
        orderproducts.firstWhere((element) => element.id == product.id);
    showDeleteItemModal = true;
  }

  @action
  delectProduct(int qtd, String? description) async {
    isLoading = true;
    try {
      final index = orderproducts.indexWhere((element) =>
          element.id == selectedProduct?.id && element.pivot?.pdvId == pdv.id);
      final int qtdProduct = selectedProduct?.pivot?.quantity ?? 1;

      final productRemoved = AccommodationItemRemovedModel(
          accommodationId: currentAccommodation!.id,
          productId: selectedProduct!.id,
          quantity: qtd.toDouble(),
          obs: description);

      if (qtdProduct > qtd) {
        final product = selectedProduct!.copyWith(
            pivot:
                selectedProduct!.pivot!.copyWith(quantity: qtdProduct - qtd));
        orderproducts[index] = product;

        await _roomService.updateAccommodationProdutcs(
            currentAccommodation!, orderproducts);
        await _roomService.removeProductFromAccommodation(productRemoved);
        success = 'Produto removido com sucesso';
      } else {
        final product = selectedProduct!.copyWith(
            pivot:
                selectedProduct!.pivot!.copyWith(quantity: qtdProduct - qtd));
        orderproducts[index] = product;

        await _roomService.updateAccommodationProdutcs(
            currentAccommodation!, orderproducts);

        await _roomService.removeProductFromAccommodation(productRemoved);
        orderproducts.removeAt(index);
        success = 'Produto removido com sucesso';
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  insertProduct(ProductModel product, int qtd) async {
    isLoading = true;
    try {
      final index = orderproducts
          .indexWhere((e) => e.id == product.id && e.pivot?.pdvId == pdv.id);
      if (index != -1) {
        final producFinded = orderproducts.elementAt(index);
        final qtdExist = producFinded.pivot!.quantity;
        final pivot = producFinded.pivot?.copyWith(quantity: qtdExist + qtd);
        orderproducts[index] = producFinded.copyWith(pivot: pivot);
      } else {
        final pivot = ProductPivot(
            accommodationId: currentAccommodation!.id,
            productId: product.id,
            quantity: qtd,
            pdvId: pdv.id);
        final productAdd = product.copyWith(pivot: pivot);
        orderproducts.add(productAdd);
      }
      await _roomService.updateAccommodationProdutcs(
          currentAccommodation!, orderproducts);
      success = 'Produto adicionado com sucesso';
    } catch (e) {
      error = 'Erro ao adicionar produto';
    } finally {
      isLoading = false;
    }
  }
}
