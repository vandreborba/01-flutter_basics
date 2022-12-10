import 'package:aula01_flutter_basics/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

// void main() => runApp(MyApp()); // Outra maneira de escrever a mesma coisa de cima.

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print("Question index: ${_questionIndex}");
  }

  /* Funções Anônimas:
  // () => print("Answer 2 choosen") // Uma linha
  // 
  // () {
           print("Answer 3 choosen"); // Mais de uma linha
        }
  // */

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': "What's your favorite 456 color?",
        'answers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': "What's yout favorite animal?",
        'answers': ['Rabbit', "Snake", 'Elephant', 'Lion']
      },
      {
        'questionText': "Another question",
        'answers': ['One', "Two", '3', 'pi']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My First App")),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]['questionText']),
            ...(questions[_questionIndex]['answers'] as List<String>).map(
              (answers) {
                // este "map" faz um for com cada elemento da lista. (Não sei se não poderia usar um for)
                // o "..." transforma a lista em elementos da lista. Repare que sem isto teríamos uma lista dentro de outra lista, não é isto que queremos.
                //
                return Answer(_answerQuestion, answers);
              },
            ).toList()
          ],
        ),
      ),
    );
  }
}
