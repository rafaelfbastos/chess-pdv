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

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
pdv: ${pdv}
    ''';
  }
}
