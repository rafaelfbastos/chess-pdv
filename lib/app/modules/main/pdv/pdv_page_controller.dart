import 'package:chess_pdv/app/core/excepition/fetch_exception.dart';
import 'package:chess_pdv/app/model/pdv_model.dart';
import 'package:chess_pdv/app/model/product_model.dart';
import 'package:chess_pdv/app/modules/main/pdv_store.dart';
import 'package:chess_pdv/app/services/product_service.dart';
import 'package:mobx/mobx.dart';
part 'pdv_page_controller.g.dart';

class PdvPageController = PdvPageControllerBase with _$PdvPageController;

abstract class PdvPageControllerBase with Store {
  final PdvStore _pdvStore;
  final ProductService _productService;

  PdvPageControllerBase({
    required PdvStore pdvStore,
    required ProductService productService,
  })  : _pdvStore = pdvStore,
        _productService = productService;

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @computed
  PdvModel get pdv => _pdvStore.selectedPdv!;

  @observable
  ObservableList<ProductModel> products = ObservableList<ProductModel>();

  @observable
  bool expanded = false;

  @computed
  int get flex1 => expanded ? 10 : 11;

  @computed
  int get flex2 => expanded ? 2 : 1;

  @action
  Future<void> loadProducts() async {
    isLoading = true;
    try {
      products.clear();
      final productsList = await _productService.fetchAll();
      products.addAll(productsList);
    } on FetchException catch (e) {
      error = e.message;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  toogleExpanded() {
    expanded = !expanded;
  }

  load() async {
    Future.wait([loadProducts()]);
  }
}
