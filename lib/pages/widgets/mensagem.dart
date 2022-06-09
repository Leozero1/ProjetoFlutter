import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void erro(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.redAccent.withOpacity(0.4),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}

void sucesso(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.greenAccent.withOpacity(0.4),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}

showAlertDialog(BuildContext context) {
  var uid = FirebaseAuth.instance.currentUser!.uid;
  var simbutton = ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Color.fromRGBO(10, 186, 84, 1),
    ),
    onPressed: () {
      var progresso = FirebaseFirestore.instance.collection('progresso').doc(uid.toString());
      progresso.update({
        'uid' : FirebaseAuth.instance.currentUser!.uid,
        'pontos': FieldValue.increment(1),
        'totalPontosPossiveis': FieldValue.increment(1),
        'naoAproveitado': FieldValue.increment(0),
      });
      Navigator.pop(context);
    },
    child: Text('Sim'),
  );
  var naobutton = ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Color.fromRGBO(10, 186, 84, 1),
    ),
    onPressed: () {
      var progresso = FirebaseFirestore.instance.collection('progresso').doc(uid.toString());
      progresso.update({
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'naoAproveitado': FieldValue.increment(1),
        'totalPontosPossiveis': FieldValue.increment(1),
        'pontos': FieldValue.increment(0),
      });
      Navigator.pop(context);
    },
    child: Text('Não'),
  );
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(8.0),
          child: AlertDialog(
            title: Text('Relizou a rotina?'),
            actions: [
              simbutton,
              naobutton,
            ],
          ),
        );
      });
}
