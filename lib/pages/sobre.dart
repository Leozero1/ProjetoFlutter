import 'package:flutter/material.dart';
import 'package:projeto/pages/widgets/navigationbar.dart';

class Sobre extends StatefulWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Sobre',
              style: TextStyle(
                color: Color.fromRGBO(10, 186, 84, 1),
                fontSize: 34,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'O objetivo principal do aplicativo é auxiliar o usuário na sua organização a partir da criação de rotinas, para melhorar sua qualidade de vida e atingir suas metas pessoais, profissionais e acadêmicas.',
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: 20, color: const Color.fromARGB(255, 99, 95, 95)),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Desenvolvedores',
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 26, color: Color.fromRGBO(10, 186, 84, 1)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'marcelo.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  width: 200,
                ),
                Image.asset(
                  'leo.jpg',
                  height: 150,
                  width: 150,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Marcelo Inácio',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(10, 186, 84, 1)),
                ),
                SizedBox(
                  width: 240,
                ),
                Text(
                  'Leonardo Cesar',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(10, 186, 84, 1)),
                ),
              ],
            ),
            SizedBox(
              height: 75,
            ),
          ],
        ),
      ),
    );
  }
}
