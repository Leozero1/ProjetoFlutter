// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:projeto/cadastro.dart';
import 'package:projeto/main.dart';

class Sobre extends StatefulWidget {
  const Sobre({ Key? key }) : super(key: key);

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {

  String email = '';
  String nome = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    final valida = ModalRoute.of(context)!.settings.arguments as Validarcadastro;
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Color.fromRGBO(10, 186, 84, 1),
        actions: <Widget> [
          Row(
            children: [
              Text(valida.nome, style: TextStyle(color: Colors.white,fontSize: 20),),
              IconButton(
                padding: const EdgeInsets.only(
                  right: 25,
                ),
                icon: const Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                  size: 40,
                  ),
                  onPressed: (){
                    email = valida.email;
                    senha = valida.senha;
                    nome = valida.nome;
                    Navigator.pushNamed(context, '/Perfil', arguments: Validarcadastro(email, senha, nome));
                  },
              ),
            ],
          ),
          

        ]
        ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [

          SizedBox(
            height: 50,
          ),
          
          const Text('Sobre',
          style: TextStyle(color: Color.fromRGBO(10, 186, 84, 1), fontSize: 34,),
          textAlign: TextAlign.left,
          ),
          
          const SizedBox(
            height: 20,
          ),

          const Text('O objetivo do aplicativo é auxiliar o usuário na criação de hábitos saudáveis e sua organização de rotinas, para atingir suas metas pessoais, profissionais e acadêmicas.',textAlign: TextAlign.left, style: const TextStyle(fontSize: 20, color: const Color.fromARGB(255, 99, 95, 95)),),

          const SizedBox(
            height: 100,
          ),

          const Text('Desenvolvedores', textAlign: TextAlign.center, style: TextStyle(fontSize: 26, color: Color.fromRGBO(10, 186, 84, 1)),),

          const SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [

              Image.asset('marcelo.png', height: 150, width: 150,),

              SizedBox(
                width: 200,
              ),


              Image.asset('leo.jpg', height: 150, width: 150,)
            ],
          ),

          SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Marcelo Inácio', style: TextStyle(fontSize: 16, color: Color.fromRGBO(10, 186, 84, 1) ),),

              SizedBox(
                width: 240,
              ),

              Text('Leonardo Cesar', style: TextStyle(fontSize: 16, color: Color.fromRGBO(10, 186, 84, 1)),),
            ],
          ),

          SizedBox(
            height: 75,
          ),

          //Uma alternativa ao invés de utilizar o BottomNavigationBar
          Container(
            color: Color.fromRGBO(10, 186, 84, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.timer),
                  color: Colors.white,
                  onPressed: (){
                    email = valida.email;
                    senha = valida.senha;
                    nome = valida.nome;
                    Navigator.pushNamed(context, '/Rotinas', arguments: Validarcadastro(email, senha, nome));
                  },
                ),

                IconButton(
                  icon: Icon(Icons.emoji_events),
                  color: Colors.white,
                  onPressed: (){
                    email = valida.email;
                    senha = valida.senha;
                    nome = valida.nome;
                    Navigator.pushNamed(context, '/Ranking', arguments: Validarcadastro(email, senha, nome));

                  },
                ),

                IconButton(
                  icon: Icon(Icons.error),
                  color: Colors.white,
                  onPressed: (){
                    email = valida.email;
                    senha = valida.senha;
                    nome = valida.nome;
                    Navigator.pushNamed(context, '/Sobre', arguments: Validarcadastro(email, senha, nome));
                  },
                ),
                
                IconButton(
                  icon: Icon(Icons.settings),
                  color: Colors.white,
                  onPressed: (){
                    email = valida.email;
                    senha = valida.senha;
                    nome = valida.nome;
                    Navigator.pushNamed(context, '/Config', arguments: Validarcadastro(email, senha, nome));
                  },
                ),

                
              ],
            ),

          ),
    
        ],

      ),
      
    );
  }
}