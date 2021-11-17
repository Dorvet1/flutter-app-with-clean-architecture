// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'via_cep_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ViaCepController on ViaCepControllerBase, Store {
  final _$viaCepStateAtom = Atom(name: 'ViaCepControllerBase.viaCepState');

  @override
  ViaCepState get viaCepState {
    _$viaCepStateAtom.reportRead();
    return super.viaCepState;
  }

  @override
  set viaCepState(ViaCepState value) {
    _$viaCepStateAtom.reportWrite(value, super.viaCepState, () {
      super.viaCepState = value;
    });
  }

  final _$ViaCepControllerBaseActionController =
      ActionController(name: 'ViaCepControllerBase');

  @override
  dynamic changeState(ViaCepState value) {
    final _$actionInfo = _$ViaCepControllerBaseActionController.startAction(
        name: 'ViaCepControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$ViaCepControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
viaCepState: ${viaCepState}
    ''';
  }
}
