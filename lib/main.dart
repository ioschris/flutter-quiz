import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What was the nickname given to Clarke by the Grounders?',
      'answers': [
        {'text': 'Heda', 'score': 0},
        {'text': 'Skairipa', 'score': 0},
        {'text': 'Wanheda', 'score': 10},
        {'text': 'Wanripa', 'score': 0}
      ],
    },
    {
      'questionText': 'What was Bellamy’s catchphrase for Octavia?',
      'answers': [
        {'text': '“Doing what I think is right.”', 'score': 0},
        {'text': '“My sister, my responsibility.”', 'score': 10},
        {'text': '“Protecting you at all costs.”', 'score': 0},
        {'text': '“My sister is the priority.”', 'score': 0}
      ],
    },
    {
      'questionText': 'How did Lexa die?',
      'answers': [
        {'text': 'Gunshot', 'score': 10},
        {'text': 'Praimfaya', 'score': 0},
        {'text': 'In the war versus Mount Weather', 'score': 0},
        {'text': 'Killed by Roan', 'score': 0}
      ],
    },
    {
      'questionText':
          'Why did Alie try to convince Clarke to NOT pull the kill switch?',
      'answers': [
        {'text': 'Everyone who took the chip would die', 'score': 0},
        {'text': 'Earth would be not be survivable in 6 months', 'score': 10},
        {'text': 'She knew the clans would kill each other', 'score': 0},
        {'text': 'There were too many people on earth', 'score': 0}
      ],
    },
    {
      'questionText':
          'Clarke made a list of 100 people who would live in the ship during Praimfaya. Who was NOT on this list?',
      'answers': [
        {'text': 'Monty', 'score': 10},
        {'text': 'Abby', 'score': 0},
        {'text': 'Bellamy', 'score': 0},
        {'text': 'Jasper', 'score': 0}
      ],
    },
    {
      'questionText': 'What does the phrase “Jus drein jus daun” mean?',
      'answers': [
        {'text': '“Your fight is over.”', 'score': 0},
        {'text': '“Kill all of them.”', 'score': 0},
        {'text': '“Time to go to war.”', 'score': 0},
        {'text': '“Blood must have blood.”', 'score': 10}
      ],
    },
    {
      'questionText': 'How many clans of Grounders were there originally?',
      'answers': [
        {'text': '10', 'score': 0},
        {'text': '12', 'score': 10},
        {'text': '8', 'score': 0},
        {'text': '13', 'score': 0}
      ],
    },
    {
      'questionText':
          'All of the people in Mount Weather were killed besides who?',
      'answers': [
        {'text': 'President Wallace', 'score': 0},
        {'text': 'Maya', 'score': 0},
        {'text': 'Emerson', 'score': 10},
        {'text': 'The children', 'score': 0}
      ],
    },
    {
      'questionText': 'Why was Finn put in prison on the Ark?',
      'answers': [
        {'text': 'Sending Raven on a spacewalk', 'score': 10},
        {'text': 'Getting into a physical altercation', 'score': 0},
        {'text': 'Trying to kill Jaha', 'score': 0},
        {'text': 'Stealing medication ', 'score': 0}
      ],
    },
    {
      'questionText': 'Which one of these is NOT a nickname given to Octavia?',
      'answers': [
        {'text': 'Blodreina', 'score': 0},
        {'text': 'The Girl Under the Floor', 'score': 0},
        {'text': 'Skairipa', 'score': 0},
        {'text': 'Commander of Air', 'score': 10}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  var _answerResult = '';

  void _answerQuestion(int score) {
    score == 0 ? _answerResult = 'Incorrect' : _answerResult = 'Correct';

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _answerResult = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('The 100 - Quiz Game'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
                answerResult: _answerResult,
                currentScore: _totalScore,
              )
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}
