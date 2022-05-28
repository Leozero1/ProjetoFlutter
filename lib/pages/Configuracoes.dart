import 'package:flutter/material.dart';
import 'package:projeto/main.dart';
import 'package:projeto/pages/cadastro.dart';

class Config extends StatefulWidget {
  const Config({Key? key}) : super(key: key);

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Configurações',
                  style: TextStyle(
                    color: const Color.fromRGBO(10, 186, 84, 1),
                    fontSize: 34,
                  )),
            ],
          ),
          Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: const Text(
                  'Mudar tema Claro/Escuro',
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  //Mudar o estilo de todo o botão
                  primary: const Color.fromRGBO(10, 186, 84, 1),
                  onPrimary: Colors.white,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  padding: const EdgeInsets.fromLTRB(75, 20, 75, 20),
                ),
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}
