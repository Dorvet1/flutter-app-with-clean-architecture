import 'package:appviacep/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'splash_controller.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/page',
      child: (_, ___) => SplashPage(),
    ),
  ];
}
