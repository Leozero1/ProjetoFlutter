import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto/pages/cadastro.dart';
import 'package:projeto/pages/widgets/mensagem.dart';

class Rotinas extends StatefulWidget {
  const Rotinas({Key? key}) : super(key: key);

  @override
  State<Rotinas> createState() => _RotinasState();
}

class _RotinasState extends State<Rotinas> {
  var rotinas;
  var progresso;

  @override
  void initState() {
    super.initState();
    rotinas = FirebaseFirestore.instance
        .collection('rotinas')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(10, 186, 84, 1),
          child: Icon(Icons.add),
          onPressed: (() => Navigator.pushNamed(context, '/CriarRotina'))),
      body: Container(
        padding: const EdgeInsets.all(15),
        //
        // Exibir os documentos da Coleção
        //
        child: StreamBuilder<QuerySnapshot>(
          //fonte de dados
          stream: rotinas.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: Text('Não foi possível conectar.'));
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context, index) {
                    return exibirDocumento(dados.docs[index]);
                  },
                );
            }
          },
        ),
      ),
    );
  }

  exibirDocumento(item) {
    String nomeRotina = item.data()['nomeRotina'];
    String meta = item.data()['meta'];
    DateTime dtvalidade = (item.data()['dataValidade'] as Timestamp).toDate();
    TimeOfDay _horaInicio = firebaseToTimeOfDay(item.data()['horaInicio']);
    TimeOfDay _horafim = firebaseToTimeOfDay(item.data()['horaFim']);
    String diasDaSemana = (item.data()['diasDaSemana']);

    return Column(children: [
      // Container titulo da rotina
      Container(
        padding: const EdgeInsets.all(10.0),
        color: Color.fromRGBO(10, 186, 84, 1),
        alignment: Alignment.topCenter,
        child: Text(
          nomeRotina,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),

      Container(
        padding: EdgeInsets.all(10),
        color: Colors.grey.shade200,
        alignment: Alignment.center,
        // Texto onde ficara o periodo da rotina
        child: Text(
          //Separando o TimeOfDay em horas e minutos
          _horaInicio.hour.toString().padLeft(2, '0') +
              ':' +
              _horaInicio.minute.toString().padLeft(2, '0') +
              ' até ' +
              _horafim.hour.toString().padLeft(2, '0') +
              ':' +
              _horafim.minute.toString().padLeft(2, '0'),
          style: TextStyle(fontSize: 16, color: Color.fromRGBO(10, 186, 84, 1)),
        ),
      ),

      Container(
        padding: EdgeInsets.all(10),
        color: Colors.grey.shade200,
        alignment: Alignment.center,
        // Texto onde ficara o periodo da rotina
        child: Text(
          //Separando o TimeOfDay em horas e minutos
          diasDaSemana,
          style: TextStyle(fontSize: 16, color: Color.fromRGBO(10, 186, 84, 1)),
        ),
      ),

      Container(
        padding: const EdgeInsets.all(20),
        color: Colors.grey.shade200,
        alignment: Alignment.center,
        child: Text(
          meta,
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(10, 186, 84, 1),
          ),
        ),
      ),

      Container(
        padding: const EdgeInsets.all(5),
        color: Colors.grey.shade200,
        alignment: Alignment.bottomRight,
        // Texto de até quando esta rotina será aplicada.
        child: Text(
          //Formatando a data para o modelo brasileiro e com apenas o dia, mês e ano
          'até ' +
              dtvalidade.day.toString().padLeft(2, '0') +
              '/' +
              dtvalidade.month.toString().padLeft(2, '0') +
              '/' +
              dtvalidade.year.toString(),
          style: TextStyle(fontSize: 16, color: Color.fromRGBO(10, 186, 84, 1)),
        ),
      ),

      Container(
        color: const Color.fromRGBO(10, 186, 84, 1),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(10, 186, 84, 1),
                ),
                child: Text('Alterar'),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/CriarRotina',
                    arguments: item.id,
                  );
                }),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(10, 186, 84, 1),
                ),
                onPressed: () {
                  showAlertDialog(context);
                },
                child: Text('Realizou ?')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(10, 186, 84, 1),
                ),
                child: Text('Excluir'),
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('rotinas')
                      .doc(item.id)
                      .delete();

                  sucesso(context, 'Item removido com sucesso.');
                }),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      )
    ]);
  }

  TimeOfDay firebaseToTimeOfDay(Map data) {
    return TimeOfDay(hour: data['hour'], minute: data['minute']);
  }
}
