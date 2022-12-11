import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  void playAudio(int fileNumber) {
    player.play('note${fileNumber}.wav');
  }

  Expanded buildXyloKey(dynamic color, int fileNumber) {
    return Expanded(
      child: TextButton(
        child: Container(
          color: color,
        ),
        onPressed: () => playAudio(fileNumber),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildXyloKey(Colors.red, 1),
              buildXyloKey(Colors.orange, 2),
              buildXyloKey(Colors.yellow, 3),
              buildXyloKey(Colors.green, 4),
              buildXyloKey(Colors.blue, 5),
              buildXyloKey(Colors.purple, 6),
              buildXyloKey(Colors.black, 7)
            ],
          ),
        ),
      ),
    );
  }
}
