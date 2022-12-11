import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(BallPage());

class BallPage extends StatefulWidget {
  // const BallPage({ Key? key }) : super(key: key);

  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int coolAnswerPath = Random().nextInt(4) + 1;

  void answerQuestion() {
    setState(() {
      coolAnswerPath = Random().nextInt(4) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ask me anything"),
          backgroundColor: Colors.blue[900],
        ),
        body: Container(
          child: Center(
            child: TextButton(
              child: Image.asset('images/ball${coolAnswerPath}.png'),
              onPressed: answerQuestion,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
