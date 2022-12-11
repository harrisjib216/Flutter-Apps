import 'package:flutter/material.dart';
import 'package:quizzler/modules/Questions.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scores = [];
  List<Question> questions = Questions.getAll();
  int selectedQuestionIndex = 0;
  bool canAnswer = true;

  void answerQuestion(bool answer) {
    if (!canAnswer) {
      return;
    }

    // update quiz state
    setState(() {
      // present the answer to the user
      final isCorrect = (answer == questions[selectedQuestionIndex].answer);
      scores.add(Icon(
        isCorrect ? Icons.check : Icons.close,
        color: isCorrect ? Colors.green : Colors.red,
      ));

      // move to next question
      if (selectedQuestionIndex < questions.length - 1) {
        selectedQuestionIndex++;
      } else {
        canAnswer = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[selectedQuestionIndex].label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: canAnswer ? () => answerQuestion(true) : null,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: canAnswer ? () => answerQuestion(false) : null,
            ),
          ),
        ),
        Row(
          children: scores,
        )
      ],
    );
  }
}
