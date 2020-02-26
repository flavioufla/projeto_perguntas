import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final pergunta;
  final _perguntas;
  final respostasString;
  final responder;

  Questionario(
    this._perguntas,
    this.pergunta,
    this.respostasString,
    this.responder,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(_perguntas[pergunta]['texto']),
        ...respostasString.map((resp) {
          return Resposta(
            resp['texto'],
            () => responder(resp['pontuacao']),
          );
        }).toList()
      ],
    );
  }
}
