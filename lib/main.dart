import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var pergunta = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 9},
        {'texto': 'Verde', 'pontuacao': 5},
        {'texto': 'Branco', 'pontuacao': 7},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 5},
        {'texto': 'Cobra', 'pontuacao': 4},
        {'texto': 'Elefante', 'pontuacao': 2},
        {'texto': 'Leão', 'pontuacao': 8},
      ]
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Maria', 'pontuacao': 6},
        {'texto': 'João', 'pontuacao': 9},
        {'texto': 'Pedro', 'pontuacao': 3},
      ]
    }
  ];

  void responder(pontuacao) {
      if (tempPerguntaSelecionada) {
        setState(() => pergunta++);
        _pontuacaoTotal += pontuacao;
      }
      print(pergunta);

    print('Pontuação: $_pontuacaoTotal');
  }

  void _reiniciarQuestionario(){
    setState(() {
      pergunta = 0;
      _pontuacaoTotal = 0;
    });

  }

  bool get tempPerguntaSelecionada {
    return pergunta < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    final respostasString =
        tempPerguntaSelecionada ? _perguntas[pergunta]['respostas'] : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: tempPerguntaSelecionada
            ? Questionario(
                _perguntas,
                pergunta,
                respostasString,
                responder,
              )
            : Resultado(_pontuacaoTotal,_reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
