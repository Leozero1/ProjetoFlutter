import 'package:flutter/material.dart';
import 'package:projeto/pages/Configuracoes.dart';
import 'package:projeto/pages/progresso.dart';
import 'package:projeto/pages/rotinas.dart';
import 'package:projeto/pages/sobre.dart';

class ControleNavegacao extends StatefulWidget {
  const ControleNavegacao({Key? key}) : super(key: key);

  @override
  State<ControleNavegacao> createState() => _ControleNavegacaoState();
}

class _ControleNavegacaoState extends State<ControleNavegacao> {
  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageViewController,
        children: const [
          Sobre(),
          Rotinas(),
          Progresso(),
          Config(),
        ],
      ),
      appBar: AppBar(
        backwardsCompatibility: mounted,
          backgroundColor: Color.fromRGBO(10, 186, 84, 1),
          actions: <Widget>[
            Row(
              children: [
                Text(
                  '',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                IconButton(
                  padding: const EdgeInsets.only(
                    right: 25,
                  ),
                  icon: const Icon(
                    Icons.account_circle_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ]),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              backgroundColor: Color.fromRGBO(10, 186, 84, 1),
              type: BottomNavigationBarType.fixed,
              currentIndex: pageViewController.page?.round() ?? 0,
              onTap: (index) {
                pageViewController.jumpToPage(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                  label: 'Sobre',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.timer,
                    color: Colors.white,
                  ),
                  label: 'Rotinas',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.emoji_events,
                      color: Colors.white,
                    ),
                    label: 'Progresso'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings, color: Colors.white),
                  label: 'Config',
                )
              ],
            );
          }),
    );
  }
}
