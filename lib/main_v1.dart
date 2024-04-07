import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';

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
      'O que procura?',
      'Qual a capital da Assíria',
      'Qual é a sua cor favorita?',
      'Qual é a velocidade de uma andorinha sem carga?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]),
            ElevatedButton(
              onPressed: _responder,
              child: const Text('Resposta 1'),
            ),
            ElevatedButton(
              onPressed: funcaoRetornaOutraFuncao(),
              child: const Text('Resposta 2'),
            ),
            ElevatedButton(
              child: const Text('Resposta 3'),
              onPressed: () {
                print('resposta #3');
              },
            ),
            ElevatedButton(
              child: const Text('Resposta 4'),
              onPressed: () => print('resposta #4'),
            ),
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
