import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final questionIndex;
  final Function answerQuestion;
  final String answerResult;
  final int currentScore;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex,
      @required this.answerResult,
      @required this.currentScore});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList(),
        answerResult == 'Correct'
            ? Text(
                answerResult,
                style: TextStyle(color: Colors.green, fontSize: 28),
              )
            : Text(
                answerResult,
                style: TextStyle(color: Colors.red, fontSize: 28),
              ),
        Text('Current Score: ' + currentScore.toString()),
        Text('Question ' +
            (questionIndex + 1).toString() +
            '/' +
            questions.length.toString()),
      ],
    );
  }
}
