// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// import 'layout_challenge.dart';

void main() {
  // runApp(const LayoutChallenge());
  runApp(const BusinessCard());
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('images/me.jpeg'),
              ),
              Text(
                'Jibril Harris',
                style: TextStyle(
                  fontSize: 49,
                  color: Colors.grey[700],
                  fontFamily: 'CedarvilleCursive',
                ),
              ),
              Text(
                'Full Stack Software Engineer',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Simonetta',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 200.0,
                height: 20.0,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Card(
                margin:
                    EdgeInsets.only(left: 30, top: 5, right: 30, bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone_iphone,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "(216) 337 - 2082",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'CedarvilleCursive',
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.markunread_mailbox,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "harrisjib216@gmail.com",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'CedarvilleCursive',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Color(0xffeeeeee),
      ),
    );
  }
}
