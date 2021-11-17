import 'package:appviacep/via_cep_page/domain/entities/via_cep_details.dart';
import 'package:appviacep/via_cep_page/infra/datasource/via_cep_data_source.dart';
import 'package:appviacep/via_cep_page/infra/models/via_cep_adrees_models.dart';
import 'package:dio/dio.dart';

class ViaCepDataSourceImpl extends ViaCepDataSource {
  final Dio dio;
  ViaCepDataSourceImpl(this.dio);

  @override
  Future<ViaCepAdressModel> fetchAdress(String cep) async {
    final String url = "https://viacep.com.br/ws/$cep/json";

    var result = await this.dio.get(url);
    if (result.statusCode == 200) {
      return ViaCepAdressModel.fromJson(result.data);
    } else {
      throw Exception();
    }
  }
}
