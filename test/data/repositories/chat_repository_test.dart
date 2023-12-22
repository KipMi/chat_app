import 'package:chat_app/data/repositories/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}
class MockCollectionRefference extends Mock implements CollectionReference {}
class MockQuerySnapshot extends Mock implements QuerySnapshot {}
class MockQuery extends Mock implements Query {}
class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  group('Chat Repository', () {
    ChatRepository chatRepo = ChatRepository();
    test('- send chat', () {
      final mockFirestore = MockFirebaseFirestore();

      final mockSnapshot = [
        {
          'message': 'hello',
          'sender': 'joe',
          'time': DateTime.now(),
          'receiver': 'me'
        }
      ];

      final mockCollectionReference = MockCollectionRefference();
      final mockQuerySnapshot = MockQuerySnapshot();
      final mockQuery = MockQuery();

      setUp(() {
      when(mockFirestore.collection('chats')).thenReturn(mockCollectionReference as CollectionReference<Map<String, dynamic>>);
      when(mockCollectionReference.orderBy('timestamp', descending: true)).thenReturn(mockQuery);
      when(mockQuery.snapshots()).thenAnswer((_) => Stream.value(mockQuerySnapshot));
      when(mockQuerySnapshot.docs).thenReturn(mockSnapshot.map((data) {
        final mockDocumentSnapshot = MockDocumentSnapshot();
        when(mockDocumentSnapshot.data()).thenReturn(data);
        return mockDocumentSnapshot;
      }).toList());
    });



      expect(chatRepo.fetchChatMessages(), equals(mockSnapshot));
    });
  });
}
