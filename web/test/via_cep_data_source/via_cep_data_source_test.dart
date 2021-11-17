import 'package:appviacep/core/app_module.dart';
import 'package:appviacep/via_cep_page/external/via_cep_external.dart';
import 'package:appviacep/via_cep_page/infra/models/via_cep_adrees_models.dart';
import 'package:appviacep/via_cep_page/presentes/states/via_cep_state.dart';
import 'package:appviacep/via_cep_page/presentes/via_cep_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_test/flutter_test.dart';

main() {
  final dio = Dio();
  final dataSource = ViaCepDataSourceImpl(dio);

  test('deve retornar cep', () async {
    final result = await dataSource.fetchAdress('63125025');
    print(result.city);
    expect(result, isA<ViaCepAdressModel>());
  });
}
