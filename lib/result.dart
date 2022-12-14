import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function() resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 9) {
      resultText = "Peasant choicesπ";
    } else if (resultScore <= 12) {
      resultText = "Rookie numbers π";
    } else if (resultScore <= 16) {
      resultText = "Shinobi level π";
    } else {
      resultText = "GOAT level π";
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
          RaisedButton(
            child: Text("Restart Quiz!"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
