import 'package:chat_app/theme.dart';
import 'package:chat_app/widgets/_exports.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/widgets/app_scaffold.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  static const String routeName = "Messages";

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _Stories(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              ((context, index) {
                return Text("3");
              }),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Text(
            "Stories",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColors.textFaded,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Avatar.large(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
