import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto/pages/widgets/mensagem.dart';


class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(10, 186, 84, 1),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          right: 50,
          left: 50,
        ),
        child: ListView(
          children: [
            //input de Cadastro

            Container(
              decoration: BoxDecoration(
                // Mudar a cor de fundo do TexField

                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(196, 196, 196, 0.37),
              ),
              child: TextFormField(
                controller: txtNome,
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: const TextStyle(
                    //Decoração das letras que o usuário digitar
                    color: Color.fromRGBO(10, 186, 84, 1),
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    //Deixar a borda circular
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
              decoration: BoxDecoration(
                // Mudar a cor de fundo do TexField

                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(196, 196, 196, 0.37),
              ),
              child: TextFormField(
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: const TextStyle(
                    //Decoração das letras que o usuário digitar
                    color: Color.fromRGBO(10, 186, 84, 1),
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    //Deixar a borda circular
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
              decoration: BoxDecoration(
                // Mudar a cor de fundo do TexField

                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(196, 196, 196, 0.37),
              ),
              child: TextFormField(
                controller: txtSenha,
                obscureText: true,
                decoration: InputDecoration(
                  //Decoração das letras que o usuário digitar
                  labelText: "Senha",
                  labelStyle: const TextStyle(
                    color: Color.fromRGBO(10, 186, 84, 1),
                    fontSize: 20,
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15), //Deixar a borda circular
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
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                    //Mudar o estilo de todo o botão
                    primary: const Color.fromRGBO(10, 186, 84, 1),
                    onPrimary: Colors.white,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    padding: const EdgeInsets.fromLTRB(75, 20, 75, 20),
                  ),
                  onPressed: () {
                    criarConta(txtNome.text, txtEmail.text, txtSenha.text);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void criarConta(nome, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((res) {

        FirebaseFirestore.instance.collection('usuarios')
          .add(
            {
              "uid" : res.user!.uid.toString(),
              "nome" : nome,
            }
          );

      sucesso(context, 'Usuário criado com sucesso.');
      Navigator.pop(context);
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          erro(context, 'O email já fo cadastradro');
          break;
        case 'invalid-email':
          erro(context, 'O email é invalido.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }
}
