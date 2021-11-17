// ignore_for_file: prefer_const_constructors

import 'package:appviacep/via_cep_page/domain/entities/via_cep_details.dart';
import 'package:appviacep/via_cep_page/domain/error/via_cep_error.dart';
import 'package:appviacep/via_cep_page/presentes/states/via_cep_state.dart';
import 'package:appviacep/via_cep_page/presentes/via_cep_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class ViaCepPage extends StatefulWidget {
  const ViaCepPage({Key? key}) : super(key: key);

  @override
  _ViaCepPageState createState() => _ViaCepPageState();
}

ReactionDisposer? disposer;
String? labelCep;
String? uf;
String? city;
String? adress;
String? cep;
String? neighborhood;
ViaCepController controller = Modular.get<ViaCepController>();

class _ViaCepPageState extends State<ViaCepPage> {
  @override
  void initState() {
    disposer = reaction((_) => controller.viaCepState, (state) {
      _manageState(state);
    });

    super.initState();
  }

  void _manageState(state) {
    // if (state is LoadingState) {
    //   CircularProgressIndicator(
    //     valueColor: AlwaysStoppedAnimation(Colors.black),
    //   );
    // }
    if (state is FetchAdressSuccessState) {
      setState(() {
        city = state.adress.city;
        adress = state.adress.adress;
        uf = state.adress.uf;
        neighborhood = state.adress.neighborhood;
      });
    }
  }

  @override
  void dispose() {
    disposer!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBar(
          title: Padding(
              padding: EdgeInsets.all(10),
              child: Text('Digite o Cep para uma consulta')),
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, top: 40),
        child: Column(
          children: [
            TextField(
              maxLength: 8,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                labelCep = value;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                hintText: 'Cep',
                errorStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ),
            city != null
                ? Column(
                    children: [
                      TextField(
                        controller: TextEditingController(text: city),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          hintText: 'City',
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: TextEditingController(text: uf),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          hintText: 'Uf',
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: TextEditingController(text: neighborhood),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          hintText: 'Neighborhood',
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: TextEditingController(text: adress),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          hintText: 'Adress',
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
            // ignore: avoid_unnecessary_containers
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(42, 42)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ))),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      controller.fetchViaCep(labelCep!);
                      print(city);
                    },
                    child: Text(
                      'BUSCAR',
                      style: TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
