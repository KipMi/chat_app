import 'package:chat_app/data/repository-interface/i_chat_repository.dart';
import 'package:chat_app/domain/models/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatRepository implements IChatRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');

  @override
  Stream<List<Chat>> fetchChatMessages() {
    final chatQuery = chats.orderBy('time', descending: true);
    return chatQuery.snapshots().map((snapshots) {
      return snapshots.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Chat(
            sender: data['sender'],
            message: data['message'],
            time: data['time'],
            receiver: data['receiver']);
      }).toList();
    });
  }



  @override
  Future<void> sendMessage(Chat message) async {
    chats.add({
      'sender': message.sender,
      'message': message.message,
      'time': message.time,
      'receiver': message.receiver
    });
  }
}
