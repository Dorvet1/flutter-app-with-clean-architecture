import 'package:appviacep/via_cep_page/domain/entities/via_cep_details.dart';
import 'package:appviacep/via_cep_page/domain/error/via_cep_error.dart';
import 'package:appviacep/via_cep_page/domain/repository/via_cep_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ViaCepUseCase {
  Future<Either<ViaCepErro, ViaCepAdress>> call(String cep);
}

class ViaCepUseCaseImpl extends ViaCepUseCase {
  final ViaCepRepository repository;

  ViaCepUseCaseImpl(this.repository);

  @override
  Future<Either<ViaCepErro, ViaCepAdress>> call(String cep) async {
    return repository.fetchViacep(cep);
  }
}
