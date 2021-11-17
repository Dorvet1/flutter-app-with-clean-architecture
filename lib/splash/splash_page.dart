// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2000))
        .then((_) => {Modular.to.pushReplacementNamed('/viaceproute/viacep')});
    return Container(
      height: double.infinity,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/image.jpg'))),
    );
  }
}
