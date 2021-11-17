import 'package:appviacep/via_cep_page/domain/entities/via_cep_details.dart';
import 'package:appviacep/via_cep_page/domain/error/via_cep_error.dart';

abstract class ViaCepState {}

class StartState implements ViaCepState {
  const StartState();
}

class LoadingState implements ViaCepState {
  final String msg;
  const LoadingState(this.msg);
}

class FetchAdressSuccessState implements ViaCepState {
  final ViaCepAdress adress;
  FetchAdressSuccessState(this.adress);
}

class ViaCepErroState implements ViaCepState {
  final ViaCepError viaCepError;
  ViaCepErroState(this.viaCepError);
}
