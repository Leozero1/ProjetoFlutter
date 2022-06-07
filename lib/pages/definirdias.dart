import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto/pages/criarrotina.dart';
import 'package:projeto/pages/widgets/checkbox.dart';
import 'package:projeto/pages/widgets/mensagem.dart';

class DefinirDias extends StatefulWidget {
  const DefinirDias({Key? key}) : super(key: key);

  @override
  State<DefinirDias> createState() => _DefinirDiasState();
}

class _DefinirDiasState extends State<DefinirDias> {
  final List<CheckBoxModel> itens = [
    CheckBoxModel(texto: "DOM"),
    CheckBoxModel(texto: "SEG"),
    CheckBoxModel(texto: "TER"),
    CheckBoxModel(texto: "QUA"),
    CheckBoxModel(texto: "QUI"),
    CheckBoxModel(texto: "SEX"),
    CheckBoxModel(texto: "SAB"),
  ];

  String nomeRotina = '';
  String meta = '';
  late DateTime _datavalidade;
  late TimeOfDay _horaInicio;
  late TimeOfDay _horafim;
  var id;

  @override
  Widget build(BuildContext context) {
    final rotina = ModalRoute.of(context)?.settings.arguments as Rotina; //Recebendo os parametros da tela anterior

    nomeRotina = rotina.nomeRotina;
    meta = rotina.meta;
    _datavalidade = rotina.dataValidade;
    _horaInicio = rotina.horaInicio;
    _horafim = rotina.horaFim;
    id = rotina.uid;
    String listaDeDias = '';
    

    if(id!=null){
      listaDeDias = rotina.diasDaSemana;
      verificarDias(listaDeDias);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(10, 186, 84, 1),
        title: Text('Definir dias'),
      ),
      body: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (_, int index) {
          return CheckboxWidget(item: itens[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(10, 186, 84, 1),
        child: Text('Salvar'),
        onPressed: () {
          if (id == null) {
            listaDeDias = listToString();
            FirebaseFirestore.instance.collection('rotinas').add({
              "uid": FirebaseAuth.instance.currentUser!.uid,
              "nomeRotina": nomeRotina,
              "meta": meta,
              "dataValidade": _datavalidade,
              "horaInicio": timeOfDayToFirebase(_horaInicio),
              "horaFim": timeOfDayToFirebase(_horafim),
              "diasDaSemana": listaDeDias,
            });
            sucesso(context, 'Item adicionado com sucesso.');
          } else {
            listaDeDias = listToString();
            FirebaseFirestore.instance
                .collection('rotinas')
                .doc(id.toString())
                .set({
              "uid": FirebaseAuth.instance.currentUser!.uid,
              "nomeRotina": nomeRotina,
              "meta": meta,
              "dataValidade": _datavalidade,
              "horaInicio": timeOfDayToFirebase(_horaInicio),
              "horaFim": timeOfDayToFirebase(_horafim),
              "diasDaSemana": listaDeDias,
            });
            sucesso(context, 'Item alterado com sucesso.');
          }

          Navigator.pushNamed(context, '/ControleNavegacao');
        },
      ),
    );
  }

  Map timeOfDayToFirebase(TimeOfDay timeOfDay) {
    return {'hour': timeOfDay.hour, 'minute': timeOfDay.minute};
  }

  String listToString() { //Colocando os dias marcados em uma String
    List<CheckBoxModel> itensMarcados = List.from(itens.where((item) => item.checked));
    int count = 0;
    String lista = '';
    while(itensMarcados.length> count){
      lista = lista + itensMarcados.elementAt(count).texto + ' ';
      count++;
    }

    return lista;
  }

  verificarDias(String dias){ //Verificando os dias já marcados na rotina que está sendo alterada
    if(dias.contains('DOM')){
      setState(() {
        itens.elementAt(0).checked = true;
      });
    }
    if(dias.contains('SEG')){
      setState(() {
        itens.elementAt(1).checked = true;
      });
    }
    if(dias.contains('TER')){
      setState(() {
        itens.elementAt(2).checked = true;
      });
    }
    if(dias.contains('QUA')){
      setState(() {
        itens.elementAt(3).checked = true;
      });
    }
    if(dias.contains('QUI')){
      setState(() {
        itens.elementAt(4).checked = true;
      });
    }
    if(dias.contains('SEX')){
      setState(() {
        itens.elementAt(5).checked = true;
      });
    }
    if(dias.contains('SAB')){
      setState(() {
        itens.elementAt(6).checked = true;
      });
    }

  }

 
}
