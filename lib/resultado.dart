import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario,
      {super.key});

  String get fraseResultado {
    if (pontuacao > 0) {
      return "Parabéns!!!!";
    } else {
      return "Hahaha!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            onPressed: quandoReiniciarQuestionario,
            child: const Text("Reiniciar?",
                style: TextStyle(color: Colors.lightBlue, fontSize: 18)))
      ],
    );
  }
}
