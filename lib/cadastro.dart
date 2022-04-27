import 'package:flutter/material.dart';
import 'package:projeto/main.dart';
import 'package:projeto/login.dart';


//Passar variáveis do cadastro entre as telas usando a classe
class Validarcadastro{
  final String email;
  final String senha;
  final String nome;

  Validarcadastro(this.email, this.senha, this.nome);

}



class Cadastro extends StatefulWidget {
  const Cadastro({ Key? key }) : super(key: key);
  

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  var emailcadastro = '';
  var senhacadastro = '';
  var nomecadastro = '';




  @override
  Widget build(BuildContext context) {
    showAlertDialog1(BuildContext context) { 
    // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Cadastrado"),
    content: Text("Usuário cadastrado"),
    actions: [
      TextButton(
        onPressed: (){
          Navigator.pushNamed(context, LoginPage.nomerota, arguments: Validarcadastro(emailcadastro, senhacadastro, nomecadastro));
        },
        child: Text('OK'),
      ),
    ],
  );
 showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}


    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          right: 50,
          left: 50,
        ),
               
        child: ListView(
          children: <Widget> [

          


            
            //input de Cadastro

            Container(
                  decoration: BoxDecoration( // Mudar a cor de fundo do TexField

                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(196, 196, 196, 0.37),
                  ),

                  child: TextFormField(                                       
                    onChanged: (text) {nomecadastro = text;},
                    decoration:  InputDecoration(
                      labelText: "Nome",
                      labelStyle: const TextStyle( //Decoração das letras que o usuário digitar
                        color: Color.fromRGBO(10, 186, 84, 1),
                        fontSize: 20,                             
                      ),            
                                
                      border: OutlineInputBorder( //Deixar a borda circular
                        borderRadius: BorderRadius.circular(15),
                      ),                   
     
                    ),

                    style: const TextStyle(fontSize: 20),                

                  ),
            ),

            const SizedBox(
              height: 34,
            ),

            Container(
                  decoration: BoxDecoration( // Mudar a cor de fundo do TexField

                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(196, 196, 196, 0.37),
                  ),

                  child: TextFormField(
                    onChanged: (text) {emailcadastro = text;},
                    keyboardType: TextInputType.emailAddress,
                    decoration:  InputDecoration(
                      labelText: "E-mail",
                      labelStyle: const TextStyle( //Decoração das letras que o usuário digitar
                        color: Color.fromRGBO(10, 186, 84, 1),
                        fontSize: 20,                             
                      ),            
                                
                      border: OutlineInputBorder( //Deixar a borda circular
                        borderRadius: BorderRadius.circular(15),
                      ),                   
     
                    ),

                    style: const TextStyle(fontSize: 20),                

                  ),
            ),

            const SizedBox(
              height: 34,
            ),

            Container(
              decoration: BoxDecoration( // Mudar a cor de fundo do TexField

              borderRadius: BorderRadius.circular(15),
              color: const Color.fromRGBO(196, 196, 196, 0.37),
              ),

              child: TextFormField(
                onChanged: (text) {senhacadastro = text;},
                obscureText: true,
                decoration: InputDecoration( //Decoração das letras que o usuário digitar
                labelText: "Senha",
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(10, 186, 84, 1),
                  fontSize: 20,
                ),
                    
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), //Deixar a borda circular
                    ),                   
                  ),
                    
                  style: const TextStyle(fontSize: 20), 

                  ),
                ),

            const SizedBox(
              height: 34,
            ),


                const SizedBox(
                  height: 48,
                ),

                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
              
                    child: const Text('Cadastrar', style: TextStyle(fontSize:24), textAlign: TextAlign.center,),      

                    style: ElevatedButton.styleFrom( //Mudar o estilo de todo o botão
                      primary: const Color.fromRGBO(10, 186, 84, 1),
                      onPrimary: Colors.white,
                      shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding: const EdgeInsets.fromLTRB(75, 20, 75, 20),
                    ),


                    onPressed: () { 
                    
                      showAlertDialog1(context);
                      }

                    
                  ),
                ),

              

          ],
        ),
        
        ),
      
    );
  }
}

