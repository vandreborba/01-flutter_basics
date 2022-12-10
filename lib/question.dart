import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String
      questionText; // Final: Não irá mudar, depois do construtor. //Sim, ele muda, mas ele será criado novamente no build da outra classe.

  Question(this.questionText); // Maneira resumida de criar o construtor.

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
          questionText,
          style: TextStyle(fontSize: 26),
          textAlign: TextAlign.center,
        ));
  }
}
