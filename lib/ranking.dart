import 'package:flutter/material.dart';
import 'package:projeto/cadastro.dart';


class Ranking extends StatefulWidget {
  const Ranking({ Key? key }) : super(key: key);

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {

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
         
         body: Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 40,
              right: 40,
            ),
              color: Colors.white,
              child: ListView(
               children: <Widget> [
                 const SizedBox(
                  
                child: Text(
                 'Ranking',
                 style: TextStyle(
                 color: Color.fromRGBO(10,186,84,1),
                 fontSize: 29,
                  )
                ),
              ),
              
             const SizedBox(
                height: 30,
              ),
               
                //Imagem do trofeu
              SizedBox(
                 height: 120,
                 width: 120,
                 child: Image.asset('trofeu.png'),
                ),
                
               const SizedBox(
                  height: 30,
                ),
                
                
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:const [                 
                 Text('1', 
                    style: TextStyle(
                    color: Colors.yellow,
                    ),
                  ),             
                 Text(
                  'Leonardo',
                 style: TextStyle(
                   color: Colors.yellow,
                   fontSize: 18,
                   ),
                  ),  
                Icon(
                  Icons.military_tech,
                  color: Colors.yellow,)
              ],),
                const SizedBox(
                  height: 10,
                ),

              Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:const [                 
                 Text('2', 
                    style: TextStyle(
                    color: Colors.grey,
                    ),
                  ),             
                 Text(
                  'Marcelo',
                 style: TextStyle(
                   color: Colors.grey,
                   fontSize: 18,
                   ),
                  ),  
                Icon(
                  Icons.military_tech,
                  color: Colors.grey,)
              ],),
                const SizedBox(
                  height: 10,
                ),

                 
                   Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:const [                 
                 Text('3', 
                    style: TextStyle(
                    color: Colors.orange,
                    ),
                  ),             
                 Text(
                  'Joao Paulo ',
                 style: TextStyle(
                   color: Colors.orange,
                   fontSize: 18,
                   ),
                  ),  
                Icon(
                  Icons.military_tech,
                  color: Colors.orange,)
              ],),
                const SizedBox(
                  height: 10,
                ),
              
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children:const [                 
                  Text('4',    
                     style: TextStyle(
                     color: Color.fromARGB(148, 0, 0, 0),
                     ),
                   ),

                  Text(
                   'Usuario ',
                  style: TextStyle(
                    color: Color.fromARGB(148, 0, 0, 0),
                    fontSize: 18,
                    ),
                   ),  
                  Text('  '),
               
               ],),
                const SizedBox(
                  height: 10,
             
                ),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children:const [                 
                  Text('5',    
                     style: TextStyle(
                     color: Color.fromARGB(148, 0, 0, 0),
                     ),
                   ),

                  Text(
                   'Usuario ',
                  style: TextStyle(
                    color: Color.fromARGB(148, 0, 0, 0),
                    fontSize: 18,
                    ),
                   ),  
                  Text('  '),
               
               ],),
                const SizedBox(
                  height: 10,
             
                ),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children:const [                 
                  Text('6',    
                     style: TextStyle(
                     color: Color.fromARGB(148, 0, 0, 0),
                     ),
                   ),

                  Text(
                   'Usuario ',
                  style: TextStyle(
                    color: Color.fromARGB(148, 0, 0, 0),
                    fontSize: 18,
                    ),
                   ),  
                  Text('  '),
               
               ],),
                const SizedBox(
                  height: 10,
             
                ),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children:const [                 
                  Text('7',    
                     style: TextStyle(
                     color: Color.fromARGB(148, 0, 0, 0),
                     ),
                   ),

                  Text(
                   'Usuario ',
                  style: TextStyle(
                    color: Color.fromARGB(148, 0, 0, 0),
                    fontSize: 18,
                    ),
                   ),  
                  Text('  '),
               
               ],),
                const SizedBox(
                  height: 10,
             
                ),
              
                ],
              ),

         ),
    );
  }
}