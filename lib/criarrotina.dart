import 'package:flutter/material.dart';
import 'package:projeto/cadastro.dart';


class CriarRotina extends StatefulWidget {
  const CriarRotina({Key? key}) : super(key: key);

  @override
  State<CriarRotina> createState() => _CriarRotinaState();
}

class _CriarRotinaState extends State<CriarRotina> {

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
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
            
            // Título da tela. ##### É PRECISO FIXAR O CRIAR ROTINA #######
              const Padding(
                 padding: EdgeInsets.only(
                   top: 50,
                   left: 5,
                   right:200,                
                 ),
                
                 child:  Text(
                 'Criar Rotina', 
                  style: TextStyle(
                    color: Color.fromRGBO(10,186,84,1),
                    fontSize: 25,      
                  ),
                ),
             ),
              
                 const SizedBox(
                   height:40,
                  
                 ),
                  
              // Formulario Nome     
                Container(
               
                 child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration:  InputDecoration(
                    labelText: "Nome",
                    labelStyle: const TextStyle(
                      color: Color.fromRGBO(10, 186, 84, 1),
                      fontSize: 14,                             
                    ),
                   border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      
                    ),
                  ),

                  style: const TextStyle(fontSize: 14),    
                          
                ),
                
                 decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(196, 196, 196, 0.37),
                  ),
                ),

                const SizedBox(
                      height: 40,
                  ),
         
         
            Container(    
               // Botão de selecionar o periodo de dia
               child: ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: <Widget>[
                    
                    
               //Segunda Botão
                Row(children: [
                
                  
                     Radio(                 
                       value:1 ,// é preciso realizar o envento para o clique
                       groupValue: 1,
                       activeColor: const Color.fromRGBO(10, 186, 84, 1),                  
                       onChanged: (s){},             
                       ),
                        const Padding(
                          padding:EdgeInsets.only(
                            top: 10,
                            left: 60,
                            
                            //right: 50,
                          )
                         ),
                        const Text(
                           
                           "Segunda Feira",
                           style: TextStyle(                       
                           color: Color.fromARGB(121, 0, 0, 9),
                           fontSize: 20,
                
                          ),
                       ),             
                      ],    
                    ),
                
                //Terca  Botão
                 const SizedBox(
                     height: 10,
                   ),

                Row(children: [
                     Radio(                 
                       value:1 ,// é preciso realizar o envento para o clique
                       groupValue: 1,
                       activeColor: const Color.fromRGBO(10, 186, 84, 1),                  
                       onChanged: (s){},             
                       ),
                        const Padding(
                          padding:EdgeInsets.only(
                            top: 10,
                            left: 60,
                            //right: 50,
                          )
                         ),
                        const Text(
                           "Terca Feira",
                           style: TextStyle(                       
                           color: Color.fromARGB(121, 0, 0, 9),
                           fontSize: 20,
                           ),),

                    ],),                    
                 
                //Quarta  Botão
                 const SizedBox(
                     height: 10,
                   ),

                Row(children: [
                     Radio(                 
                       value:1 ,// é preciso realizar o envento para o clique
                       groupValue: 1,
                       activeColor: const Color.fromRGBO(10, 186, 84, 1),                  
                       onChanged: (s){},             
                       ),
                        const Padding(
                          padding:EdgeInsets.only(
                            top: 10,
                            left: 60,
                            //right: 50,
                          )
                         ),
                        const Text(
                           "Quarta Feira",
                           style: TextStyle(                       
                           color: Color.fromARGB(121, 0, 0, 9),
                           fontSize: 20,
                           ),),

                    ],),                    
               
                //Quinta Botão
                 const SizedBox(
                     height: 10,
                   ),

                Row(children: [
                     Radio(                 
                       value:1 ,// é preciso realizar o envento para o clique
                       groupValue: 1,
                       activeColor: const Color.fromRGBO(10, 186, 84, 1),                  
                       onChanged: (s){},             
                       ),
                        const Padding(
                          padding:EdgeInsets.only(
                            top: 10,
                            left: 60,
                            //right: 50,
                          )
                         ),
                        const Text(
                           "Quinta Feira",
                           style: TextStyle(                       
                           color: Color.fromARGB(121, 0, 0, 9),
                           fontSize: 20,
                           ),),

                    ],),                    
               
        
                // Sexta Botão
                 const SizedBox(
                     height: 10,
                   ),

                Row(children: [
                     Radio(                 
                       value:1 ,// é preciso realizar o envento para o clique
                       groupValue: 1,
                       activeColor: const Color.fromRGBO(10, 186, 84, 1),                  
                       onChanged: (s){},             
                       ),
                        const Padding(
                          padding:EdgeInsets.only(
                            top: 10,
                            left: 60,
                            //right: 50,
                          )
                         ),
                        const Text(
                           "Sexta Feira",
                           style: TextStyle(                       
                           color: Color.fromARGB(121, 0, 0, 9),
                           fontSize: 20,
                           ),),

                    ],),                    
                //Sabado  Botão
                 const SizedBox(
                     height: 10,
                   ),

                Row(children: [
                     Radio(                 
                       value:1 ,// é preciso realizar o envento para o clique
                       groupValue: 1,
                       activeColor: const Color.fromRGBO(10, 186, 84, 1),                  
                       onChanged: (s){},             
                       ),
                        const Padding(
                          padding:EdgeInsets.only(
                            top: 10,
                            left: 60,
                            //right: 50,
                          )
                         ),
                        const Text(
                           "Sabado",
                           style: TextStyle(                       
                           color: Color.fromARGB(121, 0, 0, 9),
                           fontSize: 20,
                           ),),

                    ],),                    
               
        
                //Domingo  Botão
                 const SizedBox(
                     height: 10,
                   ),

                Row(children: [
                     Radio(                 
                       value:0 ,// é preciso realizar o envento para o clique 
                       groupValue: 1,
                       activeColor: const Color.fromRGBO(10, 186, 84, 1),                  
                       onChanged: (s){},             
                       ),
                        const Padding(
                          padding:EdgeInsets.only(
                            top: 10,
                            left: 60,
                            //right: 50,
                          )
                         ),
                        const Text(
                           "Domingo",
                           style: TextStyle(                       
                           color: Color.fromARGB(121, 0, 0, 9),
                           fontSize: 20,
                           ),),

                    ],),
                  
                   const SizedBox(
                     height: 30,
                     
                ),
             ],),
            ),
               
               //Texto 'Informe o periodo de horas ' 
                 Container(
                   child: const Padding(
                     padding: EdgeInsets.all(5.0 
                       ),
                   child: Text('Informe o periodo de horas:',
                       style:TextStyle(
                       color: Color.fromRGBO(10, 186, 84, 1),
                       fontSize: 20, 
                     ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
  
               Container(
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                     labelText: 'Das',
                     labelStyle: const TextStyle(
                      color: Colors.green,
                      fontSize:16,
                      ),
                           border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),                    
                    ),
                  ),
                    style: const TextStyle(fontSize: 14),
                  ),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                     color: const Color.fromRGBO(196, 196, 196, 0.37),
                   ),
                ),

                 const SizedBox(
                    height: 20
                  ),
                
              Container(
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Até',
                      labelStyle: const TextStyle(
                       color: Colors.green,
                      fontSize:16,
                      ),
                   border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),                    
                    ),
                  ),
                    style: const TextStyle(fontSize: 14),
                  ),
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(196, 196, 196, 0.37),
                   ),
                ),

               

                const SizedBox(
                  height: 48,
                ),

                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
              
                    child: const Text('Salvar', style: TextStyle(fontSize:24), textAlign: TextAlign.center,),      

                    style: ElevatedButton.styleFrom( //Mudar o estilo de todo o botão
                      primary: const Color.fromRGBO(10, 186, 84, 1),
                      onPrimary: Colors.white,
                      shape:const  BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding: const EdgeInsets.fromLTRB(75, 20, 75, 20),
                    ),


                    onPressed: () {  },
                  ),
                ),


            ],),
     
        ),

            
      ),
    );

      
  
  }
}