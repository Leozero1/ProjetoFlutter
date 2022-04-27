import 'package:flutter/material.dart';
import 'package:projeto/cadastro.dart';
import 'package:projeto/comecar.dart';
import 'package:projeto/login.dart';
import 'package:projeto/sobre.dart';
import 'package:projeto/Configuracoes.dart';
import 'package:projeto/rotinas.dart';
import 'package:projeto/ranking.dart';
import 'package:projeto/criarrotina.dart';
import 'package:projeto/perfil.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute:'/Comecar',
    routes: {
        '/Comecar': (context) => const Comecar(),
        '/login': (context) =>  const LoginPage(),
        '/Cadastro' : (context) => const Cadastro(),
        '/Sobre' : (context) =>  const Sobre(),
        '/Rotinas' :(context) => const Rotinas(),
        '/Config' : (context) => const Config(),
        '/Ranking' : (context) => const Ranking(),
        '/CriarRotina' : (context) => const CriarRotina(),
        '/Perfil' : (context) => const Perfil(),
        
      },      
  ));
}








