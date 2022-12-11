import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['questionText']
            as String), // As vezes (dependendo da versão) tem que especificar que é um String, se não dá erro.
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map(
          (answers) {
            // este "map" faz um for com cada elemento da lista. (Não sei se não poderia usar um for)
            // o "..." transforma a lista em elementos da lista. Repare que sem isto teríamos uma lista dentro de outra lista, não é isto que queremos.
            //
            return Answer(
                () => answerQuestion(answers['score']), answers['text']);
            // precisa desta forma (função anônima) para podermos colocar argumento na função "answerQuestion". Se não tiver argumento poderíamos chamar apenas "answerQuestion"
          },
        ).toList()
      ],
    );
  }
}
