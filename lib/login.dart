import 'package:flutter/material.dart';
import 'package:projeto/main.dart';
import 'package:projeto/cadastro.dart';

class LoginPage extends StatefulWidget {
  static const nomerota = '/login';

  const LoginPage({ Key? key }) : super(key: key);

  

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  String email = '';
  String nome = '';
  String senha = '';

  

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
    title: Text("Dados inválidos"),
    content: Text("Email ou senha incorretos"),
    actions: [
      TextButton(
        onPressed: (){
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
  
  

  final valida = ModalRoute.of(context)!.settings.arguments as Validarcadastro;

    return Scaffold(
      
        
         body: Container (
           
           padding: const EdgeInsets.only(
             top: 60,
             right: 50,
             left: 50,
           ),
            
           child: ListView(
             children:  <Widget> [
                SizedBox(
                  width:100,
                  height: 100,
                  child: Image.asset('logo.png'),
               ),

                const SizedBox(
                 height: 14,
                ),

              const Center(
                child: Text('RouMeta', 
                style: TextStyle(fontSize:28, color: Color.fromRGBO(10, 186, 84, 1)),
                ),
              ),

                const SizedBox(
                 height: 41,
                ),

      //Input E-mail
                Container(
                  decoration: BoxDecoration( // Mudar a cor de fundo do TexField

                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(196, 196, 196, 0.37),
                  ),

                  child: TextFormField(
                    onChanged: (text){
                      email = (text);
                    },
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
                    onChanged: (text){
                      senha = (text);
                    },
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
                  height: 13,
                ),

                Container( //usando um container para deixar apenas o texto e um pouco do seu arredor pressionavel
                  alignment: Alignment.center,
                  child: TextButton(
                    child: const Text(
                      'Recuperar senha',
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: const Color.fromRGBO(10, 186, 84, 1), fontSize: 18),
                      ),

                    onPressed:() { },
                  ),
                ),

                const SizedBox(
                  height: 48,
                ),

                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
              
                    child: const Text('Login', style: const TextStyle(fontSize:24), textAlign: TextAlign.center,),      

                    style: ElevatedButton.styleFrom( //Mudar o estilo de todo o botão
                      primary: const Color.fromRGBO(10, 186, 84, 1),
                      onPrimary: Colors.white,
                      shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding: const EdgeInsets.fromLTRB(75, 20, 75, 20),
                    ),


                    onPressed: () {
                      if(email == valida.email && senha == valida.senha){
                      nome = valida.nome;
                      Navigator.pushNamed(context, '/Sobre', arguments: Validarcadastro(email, senha, nome));
                      }
                      else if(email == '' || senha == '' || email != valida.email || senha != valida.senha){
                        showAlertDialog1(context);
                        
                      }
                      
                    },
                  ),
                ),

                const SizedBox(
                  height: 32,
                ),

                Container( //usando um container para deixar apenas o texto e um pouco do seu arredor pressionavel
                  alignment: Alignment.center,
                  child: TextButton(
                    child: const Text(
                      'Cadastrar',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Color.fromRGBO(10, 186, 84, 1), fontSize: 18),
                      ),

                    onPressed:() {
                  
                      Navigator.of(context).pushNamed('/Cadastro');
                     },
                  ),
                ),
                

             ],
           ),

         )      
    );
  }
}