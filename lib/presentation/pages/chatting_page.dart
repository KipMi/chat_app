import 'package:chat_app/data/repositories/chat_repository.dart';
import 'package:chat_app/domain/models/chat.dart';
import 'package:chat_app/presentation/widgets/input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChattingPage extends StatelessWidget {
  ChattingPage({super.key});

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth fireAuth = FirebaseAuth.instance;
  CollectionReference userCol = FirebaseFirestore.instance.collection('users');

  final TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ChatRepository chatRepo = ChatRepository();
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatter'),
      ),
      body: Column(
        children: [
          StreamBuilder<List<Chat>>(
              stream: chatRepo.fetchChatMessages(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final messages = snapshot.data;

                  return Container(
                    height: 300,
                    child: ListView.builder(
                        itemCount: messages!.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                  
                          return ListTile(
                            title: Text(message.sender),
                            subtitle: Text(message.message),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          InputField(controller: messageController, labelText: 'Message'),
          ElevatedButton(
              onPressed: () {
                chatRepo.sendMessage(Chat(
                    sender: fireAuth.currentUser!.uid,
                    message: messageController.text,
                    time: Timestamp.fromDate(DateTime.now()),
                    receiver: 'him'));
              },
              child: Text('Send')),
        ],
      ),
    );
  }
}
