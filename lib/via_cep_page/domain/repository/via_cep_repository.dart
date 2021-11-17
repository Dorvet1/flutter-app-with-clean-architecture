import 'package:appviacep/via_cep_page/domain/entities/via_cep_details.dart';
import 'package:appviacep/via_cep_page/domain/error/via_cep_error.dart';
import 'package:dartz/dartz.dart';

abstract class ViaCepRepository {
  Future<Either<ViaCepErro, ViaCepAdress>> fetchViacep(String cep);
}
