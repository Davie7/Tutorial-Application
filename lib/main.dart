import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Favorite Shounen anime?',
      'answers': [
        {'text': 'Naruto', 'score': 2},
        {'text': 'JJK', 'score': 4},
        {'text': 'Kimetsu No Yaiba', 'score': 1},
        {'text': 'One piece', 'score':  3}
      ],
    },
    {
      'questionText': 'Preferred female trait?',
      'answers': [
        {'text': 'Chunky ass', 'score': 7},
        {'text': 'Huge tits', 'score': 6},
        {'text': 'Pretty smile', 'score': 5},
        {'text': 'Qhiny waist', 'score': 4}
      ],
    },
    {
      'questionText': 'Who is your favourite artist?',
      'answers': [
        {'text': 'Drake', 'score': 4},
        {'text': 'Wakadinali', 'score': 5},
        {'text': 'Kevin Gates', 'score': 6},
        {'text': 'Future', 'score': 7}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
