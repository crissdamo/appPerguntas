import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta(this.texto, this.quandoSelecionado, {super.key});

  final String texto;
  final void Function() quandoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[900]),
        onPressed: quandoSelecionado,
        child: Text(
          texto,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
    // return  Text(perguntas[_perguntaSelecionada]),
  }
}
