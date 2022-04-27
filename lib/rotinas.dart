import 'package:flutter/material.dart';
import 'package:projeto/cadastro.dart';




class Rotinas extends StatefulWidget {
  const Rotinas({ Key? key }) : super(key: key);

  @override
  State<Rotinas> createState() => _RotinasState();
}

class _RotinasState extends State<Rotinas> {
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
           children: [
             
             const SizedBox(       
               child: Text(
             'Rotinas',
             style: TextStyle(
             color: Color.fromRGBO(10,186,84,1),
             fontSize: 29,
              )
               ),
             ),
              
            Column(
             children: [
               // Container titulo da rotina
               Container(
              padding: const EdgeInsets.all(10.0),
              color:Color.fromRGBO(10, 186, 84, 1),
              alignment: Alignment.topCenter,
              child :const Text(
                'Rotina A', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
             ),

               
             
                Container(
                   padding :EdgeInsets.all(10),
                    color: Colors.grey[50],
                    alignment: Alignment.center,
                     // Texto onde ficara o periodo da rotuina
                       child :const Text(
                        'De Segunda a Sexta - 8:00 até 15:00',
                        style: TextStyle(   
                        fontSize: 12,
                        color: Color.fromRGBO(10, 186, 84, 1)
                        ),
                       ),  
                ),
              
              
              Container(
                   padding :const EdgeInsets.all(20),
                    color: Colors.grey[50],
                    alignment: Alignment.center,
                     // Texto onde mostrará o que um breve resumo do que a rotina ira fazer.
                       child :const Text(
                        'Estudos, alimentação e descanso.',
                        style: TextStyle(   
                        fontSize: 18,
                        color: Color.fromRGBO(10, 186, 84, 1),
                        ),
                       ),    
                ),

                Container(
                   padding :const EdgeInsets.all(5),
                    color: Colors.grey[50],
                    alignment: Alignment.topRight,
                     // Texto de até quando esta rotina será aplicada.
                       child :const Text(
                        'Até 15/10/2022',
                        style: TextStyle(   
                        fontSize: 12,
                        color:Color.fromRGBO(10, 186, 84, 1)
                        ),
                       ),    
                ),

                 Container(
                   color:const Color.fromRGBO(10, 186, 84, 1),
                   padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              child: ElevatedButton(
             
                child: const Text('Detalhes',
                style: TextStyle(fontSize:15),
                textAlign: TextAlign.center,),      

                style: ElevatedButton.styleFrom( //Mudar o estilo de todo o botão
                  primary: const Color.fromRGBO(10, 186, 84, 1),
                
                               
                ),
                onPressed: () {  },
              ),
               ),
             ]
              ),

            // Botão para adicionar e criar uma rotina, ainda em desenvolvimento das funções
            IconButton(
              color: Color.fromRGBO(10, 186, 84, 1),
              icon: Icon(Icons.add_circle),
              iconSize: 60,
              onPressed: (){
                  email = valida.email;
                  senha = valida.senha;
                  nome = valida.nome;
                  Navigator.pushNamed(context, '/CriarRotina', arguments: Validarcadastro(email, senha, nome));

              },
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