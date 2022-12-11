import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  static const id = "InputPage";

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  void makeNewBMI() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: makeNewBMI,
        child: Icon(Icons.add),
      ),
    );
  }
}
