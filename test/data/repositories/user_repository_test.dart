import 'package:chat_app/data/repositories/user_repository.dart';
import 'package:chat_app/domain/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test user repository', () {
    UserRepository userRepository = UserRepository();

    test('- Get User', () async {
      expect(
          await userRepository.getUser('PPkCpQ1aVgd3SQno2BiKrlCnUH22'),
          UserC(
              id: 'PPkCpQ1aVgd3SQno2BiKrlCnUH22',
              email: 'phintes@email.com',
              password: 'qwer12',
              username: 'phintes',
              firstName: 'phin',
              lastName: 'tes'));
    });
  });
}
