// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdv_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PdvStore on PdvStoreBase, Store {
  late final _$selectedPdvAtom =
      Atom(name: 'PdvStoreBase.selectedPdv', context: context);

  @override
  PdvModel? get selectedPdv {
    _$selectedPdvAtom.reportRead();
    return super.selectedPdv;
  }

  @override
  set selectedPdv(PdvModel? value) {
    _$selectedPdvAtom.reportWrite(value, super.selectedPdv, () {
      super.selectedPdv = value;
    });
  }

  late final _$pdvListAtom =
      Atom(name: 'PdvStoreBase.pdvList', context: context);

  @override
  ObservableList<PdvModel> get pdvList {
    _$pdvListAtom.reportRead();
    return super.pdvList;
  }

  @override
  set pdvList(ObservableList<PdvModel> value) {
    _$pdvListAtom.reportWrite(value, super.pdvList, () {
      super.pdvList = value;
    });
  }

  late final _$loadPdvsAsyncAction =
      AsyncAction('PdvStoreBase.loadPdvs', context: context);

  @override
  Future loadPdvs() {
    return _$loadPdvsAsyncAction.run(() => super.loadPdvs());
  }

  late final _$PdvStoreBaseActionController =
      ActionController(name: 'PdvStoreBase', context: context);

  @override
  dynamic loadStoredPdv() {
    final _$actionInfo = _$PdvStoreBaseActionController.startAction(
        name: 'PdvStoreBase.loadStoredPdv');
    try {
      return super.loadStoredPdv();
    } finally {
      _$PdvStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectPdv(PdvModel pdv) {
    final _$actionInfo = _$PdvStoreBaseActionController.startAction(
        name: 'PdvStoreBase.selectPdv');
    try {
      return super.selectPdv(pdv);
    } finally {
      _$PdvStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearSelectedPdv() {
    final _$actionInfo = _$PdvStoreBaseActionController.startAction(
        name: 'PdvStoreBase.clearSelectedPdv');
    try {
      return super.clearSelectedPdv();
    } finally {
      _$PdvStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedPdv: ${selectedPdv},
pdvList: ${pdvList}
    ''';
  }
}
