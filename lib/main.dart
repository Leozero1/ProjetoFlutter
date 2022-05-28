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
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute:'/login',
    routes: {
        '/login': (context) =>  const LoginPage(),
        '/Cadastro' : (context) => const Cadastro(),
        '/Sobre' : (context) =>  const Sobre(),
        '/Rotinas' :(context) => const Rotinas(),
        '/Config' : (context) => const Config(),
        '/CriarRotina' : (context) => const CriarRotina(),
        '/Perfil' : (context) => const Perfil(),
        '/ControleNavegacao':(context) =>  const ControleNavegacao()
        
      },      
  ));
}








