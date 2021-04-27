import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restartHandler;

  Result(this.resultScore, this.restartHandler);

  String get resultPhrase {
    var resultText = 'Quiz Finished! Your score is: ';
    return resultText + resultScore.toString() + '/100';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
            onPressed: restartHandler,
            child: Text(
              'Restart Quiz',
            ),
            style: OutlinedButton.styleFrom(
                primary: Colors.blue,
                side: BorderSide(
                  color: Colors.blue,
                )),
          )
        ],
      ),
    );
  }
}
