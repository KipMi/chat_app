import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({this.name = 'A User', this.message = 'A message', super.key});
  final String name;
  final String message;
  // final DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        child: InkWell(
          onTap: () {
            context.goNamed('chatting');
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration:
                      BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        message,
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
