import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
    print("Respondido");
  }

  void Function() funcaoRetornaOutraFuncao() {
    return () {
      print("Pergunta respondida #2");
    };
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'texto': 'O que procura?',
        'respostas': [
          'Cálice Sagrado',
          'Atravessar a ponte',
          'Santa Granada de Mão',
          'O coelho assassino'
        ],
      },
      {
        'texto': 'Qual a capital da Assíria',
        'respostas': ['Nínive', 'Assur', 'Buenos Aires', 'Kiev'],
      },
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Preto', 'Verde', 'Azul', 'Vermelho'],
      },
      {
        'texto': 'Qual é a velocidade de uma andorinha sem carga?',
        'respostas': ['10km/h', '15km/h', '7km/h', '12km/h'],
      },
    ];

    // Pega a lista de respostas
    List<String> respostas =
        perguntas[_perguntaSelecionada]['respostas'] as List<String>;

    // List<Widget> respostas = [];
    // >>>substituir por map
    // for (String textoRespo
    //     in perguntas[_perguntaSelecionada]['respostas'] as List) {
    //   respostas.add(Resposta(textoRespo, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]["texto"] as String),
            ...respostas.map((t) => Resposta(t, _responder)),
          ],
        ),
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
