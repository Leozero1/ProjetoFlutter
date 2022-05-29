import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto/pages/cadastro.dart';
import 'package:projeto/pages/widgets/checkbox.dart';

class CriarRotina extends StatefulWidget {
  const CriarRotina({Key? key}) : super(key: key);

  @override
  State<CriarRotina> createState() => _CriarRotinaState();
}

class _CriarRotinaState extends State<CriarRotina> {
  bool op = false;
  var txtnomerotina = TextEditingController();
  var txtdescricao = TextEditingController();
  var txtdas = TextEditingController();
  var txtate = TextEditingController();
  var txtdata = TextEditingController();
  late DateTime _dateTime = DateTime(0000);

  final List<CheckBoxModel> itens = [
    CheckBoxModel(texto: "Domingo"),
    CheckBoxModel(texto: "Segunda-Feira"),
    CheckBoxModel(texto: "Terça-Feira"),
    CheckBoxModel(texto: "Quarta-Feira"),
    CheckBoxModel(texto: "Quinta-Feira"),
    CheckBoxModel(texto: "Sexta-Feira"),
    CheckBoxModel(texto: "Sábado"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(10, 186, 84, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Título da tela. ##### É PRECISO FIXAR O CRIAR ROTINA #######
              const Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Text(
                  'Criar Rotina',
                  style: TextStyle(
                    color: Color.fromRGBO(10, 186, 84, 1),
                    fontSize: 25,
                  ),
                ),
              ),

              // Formulario Nome
              Container(
                child: TextFormField(
                  controller: txtnomerotina,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: const TextStyle(
                      color: Color.fromRGBO(10, 186, 84, 1),
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  style: const TextStyle(fontSize: 20),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(196, 196, 196, 0.37),
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              //Texto 'Informe o periodo de horas '
              const Text(
                'Informe o periodo de horas:',
                style: TextStyle(
                  color: Color.fromRGBO(10, 186, 84, 1),
                  fontSize: 20,
                ),
              ),

              campotextotempo('Das', txtdas),
              const SizedBox(height: 20),
              campotextotempo('Até', txtate),
              const SizedBox(
                height: 50,
              ),

              const Text(
                'Data de validade da rotina(opcional)',
                style: TextStyle(
                  color: Color.fromRGBO(10, 186, 84, 1),
                  fontSize: 20,
                ),
              ),

              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: const Text(
                    'Definir data',
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
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    ).then((date) {
                      setState(() {
                        _dateTime = date!;
                      });
                    });
                  },
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(196, 196, 196, 0.37),
                  ),
                  child: Text(
                    verificadata(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(10, 186, 84, 1),
                    ),
                  )),

              const SizedBox(
                height: 40,
              ),

              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: const Text(
                    'Próximo',
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
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  campotextotempo(rotulo, texto) {
    return Container(
      child: TextFormField(
        controller: texto,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: const TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        style: const TextStyle(fontSize: 20),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(196, 196, 196, 0.37),
      ),
    );
  }

  verificadata() {
    if (_dateTime == DateTime(0000)) {
      return 'Nehuma Data foi alocada';
    } else {
      return _dateTime.toString();
    }
  }
}
