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
  Computed<int>? _$flex1Computed;

  @override
  int get flex1 => (_$flex1Computed ??=
          Computed<int>(() => super.flex1, name: 'PdvPageControllerBase.flex1'))
      .value;
  Computed<int>? _$flex2Computed;

  @override
  int get flex2 => (_$flex2Computed ??=
          Computed<int>(() => super.flex2, name: 'PdvPageControllerBase.flex2'))
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
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
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

  late final _$expandedAtom =
      Atom(name: 'PdvPageControllerBase.expanded', context: context);

  @override
  bool get expanded {
    _$expandedAtom.reportRead();
    return super.expanded;
  }

  @override
  set expanded(bool value) {
    _$expandedAtom.reportWrite(value, super.expanded, () {
      super.expanded = value;
    });
  }

  late final _$loadProductsAsyncAction =
      AsyncAction('PdvPageControllerBase.loadProducts', context: context);

  @override
  Future<void> loadProducts() {
    return _$loadProductsAsyncAction.run(() => super.loadProducts());
  }

  late final _$PdvPageControllerBaseActionController =
      ActionController(name: 'PdvPageControllerBase', context: context);

  @override
  dynamic toogleExpanded() {
    final _$actionInfo = _$PdvPageControllerBaseActionController.startAction(
        name: 'PdvPageControllerBase.toogleExpanded');
    try {
      return super.toogleExpanded();
    } finally {
      _$PdvPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
products: ${products},
expanded: ${expanded},
pdv: ${pdv},
flex1: ${flex1},
flex2: ${flex2}
    ''';
  }
}
