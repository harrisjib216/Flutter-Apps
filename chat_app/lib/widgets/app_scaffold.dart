import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:chat_app/widgets/_exports.dart';
import 'package:chat_app/pages/contacts.dart';
import 'package:chat_app/pages/messages.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Align(
          alignment: Alignment.centerRight,
          child: Icon(Icons.search),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Avatar.small(),
          ),
        ],
      ),

      // content
      body: body,

      // navigation bar
      bottomNavigationBar: SafeArea(
        top: false,
        bottom: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TabNavigationItem(
              label: 'Messaging',
              iconData: CupertinoIcons.bubble_left_bubble_right_fill,
              isSelected: true,
              navigate: () {
                navigateTo(context, Messages.routeName);
              },
            ),
            TabNavigationItem(
              label: 'Profile',
              iconData: CupertinoIcons.person_fill,
              isSelected: false,
              navigate: () {
                navigateTo(context, "todo");
              },
            ),
            TabNavigationItem(
              label: 'Contacts',
              iconData: CupertinoIcons.person_3_fill,
              isSelected: false,
              navigate: () {
                navigateTo(context, Contacts.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
