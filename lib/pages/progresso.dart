import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Progresso extends StatefulWidget {
  const Progresso({Key? key}) : super(key: key);

  @override
  State<Progresso> createState() => _ProgressoState();
}

class _ProgressoState extends State<Progresso> {
  var progresso;

  @override
  void initState() {
    super.initState();
    progresso = FirebaseFirestore.instance
        .collection('progresso')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        //
        // Exibir os documentos da Coleção
        //
        child: StreamBuilder<QuerySnapshot>(
          //fonte de dados
          stream: progresso.snapshots(),
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

// Método para retornar os dados do grafico.
  List<PontosData> getChartData(pontos, naoaproveitado) {
    final List<PontosData> chartData = [
      // Valores das variaveis
      PontosData('Rendimento', pontos),
      PontosData('Não aproveitado', naoaproveitado),
    ];
    return chartData;
  }

  exibirDocumento(item) {
  

  int total = item.data()['totalPontosPossiveis'];
  if(total == 0){
    return Text('Ainda não existe nenhum progresso');
  }
  double naoaproveitado = ((item.data()['naoAproveitado']*100)/total); //Valor fica em porcentagem
  double pontos = ((item.data()['pontos']*100)/total ); //valor fica em porcentagem
  late List<PontosData> lista;
  lista = getChartData(pontos, naoaproveitado);


  return Container(
    padding: EdgeInsets.all(12.0),
    child: SfCircularChart(
      title: ChartTitle(
          text: 'Progresso no app \n' + 'Pontos totais possíveis: ' + total.toString()
          + '\n Números em porcentagem',
          textStyle: const TextStyle(
            color: Colors.green,
            fontSize: 24,
          )),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        textStyle: const TextStyle(
          fontSize: 24,
        ),
      ),
      palette: <Color>[Colors.green.shade500, Colors.red.shade500],
      series: <CircularSeries>[
        DoughnutSeries<PontosData, String>(
          dataSource: lista,
          xValueMapper: (PontosData data, _) => data.rendimento,
          yValueMapper: (PontosData data, _) => data.pontos,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
          ),
          animationDuration: 2200,
        )
      ],
    ),
  );
}

}

class PontosData {
  PontosData(this.rendimento, this.pontos);
  final String rendimento;
  final double pontos;
}