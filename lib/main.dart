import 'package:flutter/material.dart';
import 'package:projeto/pages/cadastro.dart';
import 'package:projeto/pages/login.dart';
import 'package:projeto/pages/sobre.dart';
import 'package:projeto/pages/Configuracoes.dart';
import 'package:projeto/pages/rotinas.dart';
import 'package:projeto/pages/criarrotina.dart';
import 'package:projeto/pages/perfil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projeto/pages/widgets/navigationbar.dart';
import 'package:projeto/pages/definirdias.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    localizationsDelegates: const [  //Formatar o ShowDataPicker e o ShowTimePicker para formato brasileiro
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    supportedLocales: [const Locale('pt', 'BR')],
    routes: {
      '/login': (context) => const LoginPage(),
      '/Cadastro': (context) => const Cadastro(),
      '/Sobre': (context) => const Sobre(),
      '/Rotinas': (context) => const Rotinas(),
      '/Config': (context) => const Config(),
      '/CriarRotina': (context) => const CriarRotina(),
      '/Perfil': (context) => const Perfil(),
      '/ControleNavegacao': (context) => const ControleNavegacao(),
      '/Definirdias': (context) => const DefinirDias(),
    },
  ));
}
