import '../../domain/models/user.dart';

abstract class IUserRepository {
  Future<UserC> getUser(String id);

  Future<void> userSignIn(String email, String password);
  Future<void> userSignUp(String email, String password, String username,
      String firstName, String lastName);
}
