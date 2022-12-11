import 'package:flutter/material.dart';

import 'package:chat_app/theme.dart';
import 'package:chat_app/pages/_exports.dart';
// import 'package:chat_app/widgets/_exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text up',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      initialRoute: Messages.routeName,
      routes: {
        Messages.routeName: (context) => const Messages(),
        Conversation.routeName: (context) => const Conversation(),
        Contacts.routeName: (context) => const Contacts(),
      },
    );
  }
}
