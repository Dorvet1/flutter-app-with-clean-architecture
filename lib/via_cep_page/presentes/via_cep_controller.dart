import 'package:appviacep/via_cep_page/domain/error/via_cep_error.dart';
import 'package:appviacep/via_cep_page/domain/usecase/via_cep_use_case.dart';
import 'package:mobx/mobx.dart';

import 'states/via_cep_state.dart';
part 'via_cep_controller.g.dart';

class ViaCepController = ViaCepControllerBase with _$ViaCepController;

abstract class ViaCepControllerBase with Store {
  ViaCepUseCase viaCepUseCase;
  ViaCepControllerBase(this.viaCepUseCase);
  @observable
  ViaCepState viaCepState = const StartState();
  @action
  changeState(ViaCepState value) => viaCepState = value;

  fetchViaCep(String cep) async {
    changeState(LoadingState('Buscando..'));
    final result = await viaCepUseCase(cep);
    result.fold((l) => changeState(ViaCepErroState(l)),
        (r) => changeState(FetchAdressSuccessState(r)));
  }
}
