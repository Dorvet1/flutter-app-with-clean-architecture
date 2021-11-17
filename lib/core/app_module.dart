import 'package:appviacep/splash/splash_module.dart';
import 'package:appviacep/via_cep_page/via_cep_modules.dart';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  // ignore: annotate_overrides
  final List<Bind> binds = [
    Bind.singleton((i) => Dio(
          BaseOptions(
            sendTimeout: 15000,
            connectTimeout: 15000,
            receiveTimeout: 15000,
          ),
        )),
  ];
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/splash', module: SplashModule()),
    ModuleRoute('/viaceproute', module: ViaCepModules())
  ];
}
