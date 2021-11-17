import 'package:appviacep/via_cep_page/domain/repository/via_cep_repository.dart';
import 'package:appviacep/via_cep_page/domain/usecase/via_cep_use_case.dart';
import 'package:appviacep/via_cep_page/external/via_cep_external.dart';
import 'package:appviacep/via_cep_page/infra/datasource/via_cep_data_source.dart';
import 'package:appviacep/via_cep_page/infra/repository/via_cep_repository.dart';
import 'package:appviacep/via_cep_page/presentes/via_cep_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentes/pages/via_cep_page.dart';

class ViaCepModules extends Module {
  // ignore: annotate_overrides
  final List<Bind> binds = [
    Bind.lazySingleton<ViaCepDataSource>((i) => ViaCepDataSourceImpl(i())),
    Bind.lazySingleton<ViaCepRepository>((i) => ViaCepRepositoryImpl(i())),
    Bind.lazySingleton<ViaCepUseCase>((i) => ViaCepUseCaseImpl(i())),
    Bind.singleton<ViaCepController>((i) => ViaCepController(i()))
  ];

  // ignore: annotate_overrides
  final List<ModularRoute> routes = [
    // ignore: prefer_const_constructors
    ChildRoute('/viacep', child: (_, __) => ViaCepPage())
  ];
}
