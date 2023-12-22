import 'package:chat_app/data/repository-interface/i_user_repository.dart';
import 'package:chat_app/domain/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository implements IUserRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<String> authenticate(String email, String password) {
    // TODO: implement authenticate
    throw UnimplementedError();
  }

  @override
  Future<UserC> getUser(String id) async {
    var result = await users.doc(id).get();
    return UserC.fromJson(result.data() as Map<String, dynamic>);
  }

  @override
  Future<void> userSignIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Future<void> userSignUp(String email, String password, String username,
      String firstName, String lastName) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    users.doc(userCredential.user!.uid).set({
      'id': userCredential.user!.uid,
      'email': email,
      'password': password,
      'username': username,
      'first_name': firstName,
      'last_name': lastName
    });
  }
}
