import 'package:flutter/material.dart';
import 'package:projeto/cadastro.dart';

class Perfil extends StatefulWidget {
  const Perfil({ Key? key }) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

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
                  onPressed: (){},
              ),
            ],
          ),
          

        ]
        ),


      body: Column(
        children: [
          Text('Nome', style: TextStyle(color: Color.fromRGBO(10, 186, 84, 1),fontSize: 24 ),),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration( // Mudar a cor de fundo do TexField

                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(196, 196, 196, 0.37),
                  ),
            child: Text(valida.nome, style: TextStyle(fontSize: 16),),
          ),
          Text('Email', style: TextStyle(color: Color.fromRGBO(10, 186, 84, 1), fontSize: 24 ),),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration( // Mudar a cor de fundo do TexField

                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(196, 196, 196, 0.37),
                  ),
            child: Text(valida.email, style: TextStyle(fontSize: 16),),
          ),

          Text('Senha', style: TextStyle(color: Color.fromRGBO(10, 186, 84, 1), fontSize: 24 ),),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration( // Mudar a cor de fundo do TexField

                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(196, 196, 196, 0.37),
                  ),
            child: Text(valida.senha, style: TextStyle(fontSize: 16),),
          )
        ],
      ),
      
    );
  }
}