import 'dart:html';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Progresso extends StatefulWidget {
  const Progresso({ Key? key }) : super(key: key);
 
  @override
  State<Progresso> createState() => _ProgressoState();
}

class _ProgressoState extends State<Progresso> {
   
   late List<PontosData>_charData;
   
  @override
  void initState() {
    _charData = getChartData(); 
    super.initState();
  }   
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      body:SfCircularChart(
        title: ChartTitle(
          text:'Progresso',
          textStyle: const TextStyle(
             color:Colors.green,
             fontSize: 28,
         )

      ),
       legend: 
         Legend(
           isVisible: true, overflowMode: LegendItemOverflowMode.wrap,
           textStyle: const TextStyle(
             fontSize: 20,
             
           ),
         ),
         palette: <Color>[Colors.green.shade500, Colors.red.shade500],
        series: <CircularSeries>[
        DoughnutSeries<PontosData, String>(
          
          dataSource: _charData,
          xValueMapper:(PontosData data, _) => data.rendimento,
          yValueMapper:(PontosData data, _) => data.pontos,
          dataLabelSettings: DataLabelSettings(isVisible: true,),
          animationDuration: 2200,
        
        )
      ],),
      
      )
    );
  }
// Método para retornar os dados do grafico.
  List<PontosData> getChartData(){
    final List<PontosData> chartData =[
     // Valores das variaveis
      PontosData('Rendimento', 70),
      PontosData('Não aproveitado', 50 ),
      
    ];
   return chartData;
  }
  
}

class PontosData{
  PontosData(this.rendimento, this.pontos);
   final String rendimento;
   final int pontos;
  
   
}