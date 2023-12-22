import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String sender;
  final String receiver;
  final String message;
  final Timestamp time;

  Chat({required this.sender, required this.message, required this.time, required this.receiver});
}
