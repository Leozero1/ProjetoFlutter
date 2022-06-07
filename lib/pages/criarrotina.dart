import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto/pages/widgets/mensagem.dart';

class CriarRotina extends StatefulWidget {
  const CriarRotina({Key? key}) : super(key: key);

  @override
  State<CriarRotina> createState() => _CriarRotinaState();
}

class Rotina {
  final String nomeRotina;
  final String meta;
  DateTime dataValidade;
  TimeOfDay horaInicio;
  TimeOfDay horaFim;
  String diasDaSemana;
  var uid;

  Rotina(this.nomeRotina, this.meta, this.dataValidade, this.horaInicio,
      this.horaFim, this.diasDaSemana, this.uid);
}

class _CriarRotinaState extends State<CriarRotina> {
  TimeOfDay firebaseToTimeOfDay(Map data) {
    return TimeOfDay(hour: data['hour'], minute: data['minute']);
  }

  retornarDocumentoById(id) async {
    await FirebaseFirestore.instance
        .collection('rotinas')
        .doc(id)
        .get()
        .then((doc) {
      txtnomerotina.text = doc.get('nomeRotina');
      txtmeta.text = doc.get('meta');
      setState(() {
        _hourTimeFim = firebaseToTimeOfDay(doc.get('horaFim'));
        _hourTimeInicio = firebaseToTimeOfDay(doc.get('horaInicio'));
        _dateTime = (doc.get('dataValidade') as Timestamp).toDate();
      });
      diasDaSemana = doc.get('diasDaSemana');
    });
  }

  var txtnomerotina = TextEditingController();
  var txtmeta = TextEditingController();
  DateTime _dateTime = DateTime(0000);
  TimeOfDay _hourTimeInicio = const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay _hourTimeFim = const TimeOfDay(hour: 00, minute: 00);
  String diasDaSemana = '';
  var id;

  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context)!.settings.arguments;
    if (id != null) {
      if (txtnomerotina.text.isEmpty && txtmeta.text.isEmpty)
        retornarDocumentoById(id);
      }

    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Rotina'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(10, 186, 84, 1),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: proximo,
        backgroundColor: const Color.fromRGBO(10, 186, 84, 1),
        child: const Icon(Icons.arrow_right),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Título da tela. ##### É PRECISO FIXAR O CRIAR ROTINA #######

              // Formulario Nome
              campotexto('Nome', txtnomerotina),

              const SizedBox(
                height: 40,
              ),

              campotexto('Meta', txtmeta),

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

              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: const Text(
                    'Definir hora inicial',
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
                    showTimePicker(
                      context: context,
                      initialTime: _hourTimeInicio,
                    ).then((pegarTempo) {
                      setState(() {
                        _hourTimeInicio = pegarTempo!;
                      });
                    }).onError((error, stackTrace) =>
                        null); // Para o cancelar funcionar
                  },
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              textotempo(_hourTimeInicio),

              const SizedBox(
                height: 20,
              ),

              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: const Text(
                    'Definir hora final',
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
                    showTimePicker(
                      context: context,
                      initialTime: _hourTimeInicio,
                    ).then((pegarTempo) {
                      setState(() {
                        _hourTimeFim = pegarTempo!;
                      });
                    }).onError((error, stackTrace) =>
                        null); //Para o cancelar funcionar
                  },
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              textotempo(_hourTimeFim),

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
                    }).onError((error, stackTrace) =>
                        null); //Para o cancelar funcionar
                  },
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              verificadata(),
            ],
          ),
        ),
      ),
    );
  }

  proximo() {
    if (txtnomerotina.text.isEmpty ||
        txtmeta.text.isEmpty ||
        _hourTimeInicio == null ||
        _hourTimeInicio == null) {
      erro(context, 'Campos vázios!!');
    } else {
      Navigator.pushNamed(context, '/Definirdias',
          arguments: Rotina(txtnomerotina.text, txtmeta.text, _dateTime,
              _hourTimeInicio, _hourTimeFim, diasDaSemana, id ));
    }
  }

  campotexto(rotulo, texto) {
    return Container(
      child: TextFormField(
        controller: texto,
        decoration: InputDecoration(
          labelText: rotulo,
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
    );
  }

  textotempo(TimeOfDay tempo) {
    //formatando a hora
    return Container(
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(196, 196, 196, 0.37),
        ),
        child: Text(
          tempo.hour.toString().padLeft(2, "0") +
              ":" +
              tempo.minute.toString().padLeft(2, "0"),
          style: const TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(10, 186, 84, 1),
          ),
        ));
  }

  verificadata() {
    //Verificando e formatando a data
    return Container(
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(196, 196, 196, 0.37),
        ),
        child: Text(
          _dateTime.day.toString().padLeft(2, "0") +
              "/" +
              _dateTime.month.toString().padLeft(2, "0") +
              "/" +
              _dateTime.year.toString().padLeft(2, "0"),
          style: const TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(10, 186, 84, 1),
          ),
        ));
  }
}
