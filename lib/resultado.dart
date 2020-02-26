import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final pontuacao;
  final _reiniciarQuestionario;

  Resultado(this.pontuacao,this._reiniciarQuestionario);

  get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante';
    } else {
      return 'Em nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            fraseResultado,
            style: TextStyle(fontSize: 20),
          ),
          RaisedButton(
            child: Text('Voltar'),
            onPressed: _reiniciarQuestionario,
          )
        ],
      ),
    );
  }
}