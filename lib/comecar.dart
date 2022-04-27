import 'package:flutter/material.dart';
import 'package:projeto/main.dart';
import 'package:projeto/login.dart';
import 'package:projeto/cadastro.dart';

//Essa tela serve apenas para iniciar os parâmetros do validador de cadastro

class Comecar extends StatefulWidget {
  const Comecar({ Key? key }) : super(key: key);

  @override
  State<Comecar> createState() => _ComecarState();
}

class _ComecarState extends State<Comecar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
              
                    child: const Text('Começar', style: const TextStyle(fontSize:24), textAlign: TextAlign.center,),      

                    style: ElevatedButton.styleFrom( //Mudar o estilo de todo o botão
                      primary: const Color.fromRGBO(10, 186, 84, 1),
                      onPrimary: Colors.white,
                      shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding: const EdgeInsets.fromLTRB(75, 20, 75, 20),
                    ),


                    onPressed: () {                     
                      Navigator.pushNamed(context, LoginPage.nomerota, arguments: Validarcadastro('99999999', '9999999999', '99999999999'));
                      
                    },
                  ),
                ),
  
      );
    
  }
  }
