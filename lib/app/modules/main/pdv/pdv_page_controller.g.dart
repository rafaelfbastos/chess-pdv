// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdv_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PdvPageController on PdvPageControllerBase, Store {
  Computed<PdvModel>? _$pdvComputed;

  @override
  PdvModel get pdv => (_$pdvComputed ??= Computed<PdvModel>(() => super.pdv,
          name: 'PdvPageControllerBase.pdv'))
      .value;
  Computed<double>? _$totalValueComputed;

  @override
  double get totalValue =>
      (_$totalValueComputed ??= Computed<double>(() => super.totalValue,
              name: 'PdvPageControllerBase.totalValue'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: 'PdvPageControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'PdvPageControllerBase.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$successAtom =
      Atom(name: 'PdvPageControllerBase.success', context: context);

  @override
  String get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(String value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$selectedRoomAtom =
      Atom(name: 'PdvPageControllerBase.selectedRoom', context: context);

  @override
  RoomExibhitionModel? get selectedRoom {
    _$selectedRoomAtom.reportRead();
    return super.selectedRoom;
  }

  @override
  set selectedRoom(RoomExibhitionModel? value) {
    _$selectedRoomAtom.reportWrite(value, super.selectedRoom, () {
      super.selectedRoom = value;
    });
  }

  late final _$guestAcommodationAtom =
      Atom(name: 'PdvPageControllerBase.guestAcommodation', context: context);

  @override
  List<String> get guestAcommodation {
    _$guestAcommodationAtom.reportRead();
    return super.guestAcommodation;
  }

  @override
  set guestAcommodation(List<String> value) {
    _$guestAcommodationAtom.reportWrite(value, super.guestAcommodation, () {
      super.guestAcommodation = value;
    });
  }

  late final _$productsAtom =
      Atom(name: 'PdvPageControllerBase.products', context: context);

  @override
  ObservableList<ProductModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$roomBusyAtom =
      Atom(name: 'PdvPageControllerBase.roomBusy', context: context);

  @override
  ObservableList<RoomExibhitionModel> get roomBusy {
    _$roomBusyAtom.reportRead();
    return super.roomBusy;
  }

  @override
  set roomBusy(ObservableList<RoomExibhitionModel> value) {
    _$roomBusyAtom.reportWrite(value, super.roomBusy, () {
      super.roomBusy = value;
    });
  }

  late final _$currentAccommodationAtom = Atom(
      name: 'PdvPageControllerBase.currentAccommodation', context: context);

  @override
  AccommodationModel? get currentAccommodation {
    _$currentAccommodationAtom.reportRead();
    return super.currentAccommodation;
  }

  @override
  set currentAccommodation(AccommodationModel? value) {
    _$currentAccommodationAtom.reportWrite(value, super.currentAccommodation,
        () {
      super.currentAccommodation = value;
    });
  }

  late final _$showRoomGridAtom =
      Atom(name: 'PdvPageControllerBase.showRoomGrid', context: context);

  @override
  bool get showRoomGrid {
    _$showRoomGridAtom.reportRead();
    return super.showRoomGrid;
  }

  @override
  set showRoomGrid(bool value) {
    _$showRoomGridAtom.reportWrite(value, super.showRoomGrid, () {
      super.showRoomGrid = value;
    });
  }

  late final _$orderproductsAtom =
      Atom(name: 'PdvPageControllerBase.orderproducts', context: context);

  @override
  ObservableList<ProductModel> get orderproducts {
    _$orderproductsAtom.reportRead();
    return super.orderproducts;
  }

  @override
  set orderproducts(ObservableList<ProductModel> value) {
    _$orderproductsAtom.reportWrite(value, super.orderproducts, () {
      super.orderproducts = value;
    });
  }

  late final _$titleProductAtom =
      Atom(name: 'PdvPageControllerBase.titleProduct', context: context);

  @override
  String get titleProduct {
    _$titleProductAtom.reportRead();
    return super.titleProduct;
  }

  @override
  set titleProduct(String value) {
    _$titleProductAtom.reportWrite(value, super.titleProduct, () {
      super.titleProduct = value;
    });
  }

  late final _$titleVendaAtom =
      Atom(name: 'PdvPageControllerBase.titleVenda', context: context);

  @override
  String get titleVenda {
    _$titleVendaAtom.reportRead();
    return super.titleVenda;
  }

  @override
  set titleVenda(String value) {
    _$titleVendaAtom.reportWrite(value, super.titleVenda, () {
      super.titleVenda = value;
    });
  }

  late final _$showDeleteItemModalAtom =
      Atom(name: 'PdvPageControllerBase.showDeleteItemModal', context: context);

  @override
  bool get showDeleteItemModal {
    _$showDeleteItemModalAtom.reportRead();
    return super.showDeleteItemModal;
  }

  @override
  set showDeleteItemModal(bool value) {
    _$showDeleteItemModalAtom.reportWrite(value, super.showDeleteItemModal, () {
      super.showDeleteItemModal = value;
    });
  }

  late final _$selectedProductAtom =
      Atom(name: 'PdvPageControllerBase.selectedProduct', context: context);

  @override
  ProductModel? get selectedProduct {
    _$selectedProductAtom.reportRead();
    return super.selectedProduct;
  }

  @override
  set selectedProduct(ProductModel? value) {
    _$selectedProductAtom.reportWrite(value, super.selectedProduct, () {
      super.selectedProduct = value;
    });
  }

  late final _$loadProductsAsyncAction =
      AsyncAction('PdvPageControllerBase.loadProducts', context: context);

  @override
  Future<void> loadProducts() {
    return _$loadProductsAsyncAction.run(() => super.loadProducts());
  }

  late final _$loadRoomsAsyncAction =
      AsyncAction('PdvPageControllerBase.loadRooms', context: context);

  @override
  Future<void> loadRooms() {
    return _$loadRoomsAsyncAction.run(() => super.loadRooms());
  }

  late final _$setCurrentAccommodationAsyncAction = AsyncAction(
      'PdvPageControllerBase.setCurrentAccommodation',
      context: context);

  @override
  Future setCurrentAccommodation(RoomExibhitionModel room) {
    return _$setCurrentAccommodationAsyncAction
        .run(() => super.setCurrentAccommodation(room));
  }

  late final _$delectProductAsyncAction =
      AsyncAction('PdvPageControllerBase.delectProduct', context: context);

  @override
  Future delectProduct(int qtd, String? description) {
    return _$delectProductAsyncAction
        .run(() => super.delectProduct(qtd, description));
  }

  late final _$insertProductAsyncAction =
      AsyncAction('PdvPageControllerBase.insertProduct', context: context);

  @override
  Future insertProduct(ProductModel product, int qtd) {
    return _$insertProductAsyncAction
        .run(() => super.insertProduct(product, qtd));
  }

  late final _$PdvPageControllerBaseActionController =
      ActionController(name: 'PdvPageControllerBase', context: context);

  @override
  dynamic clear() {
    final _$actionInfo = _$PdvPageControllerBaseActionController.startAction(
        name: 'PdvPageControllerBase.clear');
    try {
      return super.clear();
    } finally {
      _$PdvPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setError(String value) {
    final _$actionInfo = _$PdvPageControllerBaseActionController.startAction(
        name: 'PdvPageControllerBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$PdvPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSuccess(String value) {
    final _$actionInfo = _$PdvPageControllerBaseActionController.startAction(
        name: 'PdvPageControllerBase.setSuccess');
    try {
      return super.setSuccess(value);
    } finally {
      _$PdvPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic openDeleteItemModal(ProductModel product) {
    final _$actionInfo = _$PdvPageControllerBaseActionController.startAction(
        name: 'PdvPageControllerBase.openDeleteItemModal');
    try {
      return super.openDeleteItemModal(product);
    } finally {
      _$PdvPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
success: ${success},
selectedRoom: ${selectedRoom},
guestAcommodation: ${guestAcommodation},
products: ${products},
roomBusy: ${roomBusy},
currentAccommodation: ${currentAccommodation},
showRoomGrid: ${showRoomGrid},
orderproducts: ${orderproducts},
titleProduct: ${titleProduct},
titleVenda: ${titleVenda},
showDeleteItemModal: ${showDeleteItemModal},
selectedProduct: ${selectedProduct},
pdv: ${pdv},
totalValue: ${totalValue}
    ''';
  }
}
