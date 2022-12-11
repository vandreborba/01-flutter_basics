import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function
      resetFunction; // Em algumas versões tem quecolocar o VoidCallback ao invés do Function

  Result(this.resultScore, this.resetFunction);

  String get resultPhrase {
    // É uma forma de definr um valor a uma variável. (Não vi muita vantagem não, mas ok.)
    String resultText = 'You did it!';
    if (resultScore <= 2) {
      resultText = 'You are awesome!';
    } else if (resultScore <= 4) {
      resultText = 'Pretty Likeable!';
    } else {
      resultText = 'You are ... strange?!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetFunction,
            child: Text("Restart Quiz"),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
