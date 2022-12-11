import 'package:aula01_flutter_basics/question.dart';
import 'package:aula01_flutter_basics/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';

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
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = [
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 0},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 4},
        {'text': 'White', 'score': 2}
      ]
    },
    {
      'questionText': "What's yout favorite animal?",
      'answers': [
        {'text': 'Rabbit', 'score': 0},
        {'text': "Snake", 'score': 3},
        {'text': 'Elephant', 'score': 1},
        {'text': 'Lion', 'score': 3}
      ]
    },
    {
      'questionText': "Another question?",
      'answers': [
        {'text': 'One', 'score': 1},
        {'text': "Two", 'score': 2},
        {'text': '3', 'score': 3},
        {'text': 'pi', 'score': 0}
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    print("_totalScore: ${_totalScore}");

    if (_questionIndex + 1 < _questions.length) {
      print("we have more questions");
    }

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print("Question index: ${_questionIndex + 1}/${_questions.length}");
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My First App")),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                // Para o código não ficar muito bagunçado, é sempre uma boa idea separar criando outra classe.
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
