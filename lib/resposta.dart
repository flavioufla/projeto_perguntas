import 'package:flutter/material.dart';

class Resposta extends StatelessWidget{

  final texto;
  final void Function() responder;

  Resposta(this.texto,this.responder);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(texto),
        onPressed: responder,
      ),
    );
  }

  
}