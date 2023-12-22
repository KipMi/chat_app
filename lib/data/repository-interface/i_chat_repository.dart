import 'package:chat_app/domain/models/chat.dart';

abstract class IChatRepository {
  Future<void> sendMessage(Chat message);
  Stream<List<Chat>> fetchChatMessages();
}