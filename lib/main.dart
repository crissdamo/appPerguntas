import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'O que procura?',
      'respostas': [
        {'texto': 'Cálice Sagrado', 'pontuacao': 1},
        {'texto': 'Atravessar a ponte', 'pontuacao': 0},
        {'texto': 'Santa Granada de Mão', 'pontuacao': 0},
        {'texto': 'O coelho assassino', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual a capital da Assíria',
      'respostas': [
        {'texto': 'Nínive', 'pontuacao': 0},
        {'texto': 'Assur', 'pontuacao': 1},
        {'texto': 'Buenos Aires', 'pontuacao': 0},
        {'texto': 'Kiev', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 0},
        {'texto': 'Verde', 'pontuacao': 0},
        {'texto': 'Azul', 'pontuacao': 0},
        {'texto': 'Vermelho', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é a velocidade de uma andorinha sem carga?',
      'respostas': [
        {'texto': '10km/h', 'pontuacao': 0},
        {'texto': '15km/h', 'pontuacao': 0},
        {'texto': '7km/h', 'pontuacao': 0},
        {'texto': '12km/h', 'pontuacao': 1}
      ],
    },
  ];

  void _responder(int pontuacao) {
    setState(() {
      if (temPerguntaSelecionada) {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      }
    });
  }

  void _reuniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reuniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
