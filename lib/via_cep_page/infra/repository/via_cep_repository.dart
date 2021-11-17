import 'package:appviacep/via_cep_page/domain/error/via_cep_error.dart';
import 'package:appviacep/via_cep_page/domain/entities/via_cep_details.dart';
import 'package:appviacep/via_cep_page/domain/repository/via_cep_repository.dart';
import 'package:appviacep/via_cep_page/infra/datasource/via_cep_data_source.dart';
import 'package:dartz/dartz.dart';

class ViaCepRepositoryImpl extends ViaCepRepository {
  final ViaCepDataSource dataSource;
  ViaCepRepositoryImpl(this.dataSource);
  @override
  Future<Either<ViaCepErro, ViaCepAdress>> fetchViacep(String cep) async {
    ViaCepAdress adress;
    try {
      adress = await dataSource.fetchAdress(cep);
    } catch (e) {
      return left(ViaCepErro(e.toString()));
    }

    if (adress == null) {
      return left(ViaCepErro("Nenhum resultado encontrado"));
    } else {
      return right(adress);
    }
  }
}
