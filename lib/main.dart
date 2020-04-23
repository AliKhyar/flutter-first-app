import 'package:firstapp/quiz.dart';
import 'package:firstapp/result.dart';
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
    });
  }

  final _questions = const [
    {
      'questionText': "what's your favorite color?",
      'answers': ['black', 'white', 'bleu'],
    },
    {
      'questionText': "what's your favorite city?",
      'answers': ['Bm', 'Rabat', 'Fes'],
    },
    {
      'questionText': "what's your favorite language?",
      'answers': ['java', 'swift', 'dart'],
    },
  ];
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
      if (_questionIndex < _questions.length) {
        print('we have more qstns!');
      }
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_resetQuiz),
      ),
    );
  }
}
