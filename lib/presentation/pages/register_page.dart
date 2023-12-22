import 'package:chat_app/data/repositories/user_repository.dart';
import 'package:chat_app/presentation/widgets/input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;

    UserRepository userRepo = UserRepository();

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: sizeWidth,
          height: sizeHeight,
          // color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: sizeWidth * 0.9,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Register',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    InputField(
                        controller: emailController, labelText: 'E - Mail'),
                    InputField(
                      controller: passwordController,
                      labelText: 'Password',
                      obscure: true,
                    ),
                    InputField(
                        controller: usernameController, labelText: 'Username'),
                    InputField(
                        controller: firstNameController,
                        labelText: 'First Name'),
                    InputField(
                        controller: lastNameController, labelText: 'Last Name'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            userRepo.userSignUp(
                                emailController.text,
                                passwordController.text,
                                usernameController.text,
                                firstNameController.text,
                                lastNameController.text);

                            userRepo.userSignIn(
                                emailController.text, passwordController.text);

                            context.goNamed('nav-page');
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(160, 50)),
                          child: const Text('Register'),
                        ),

                        ElevatedButton(
                          onPressed: () {
                            context.goNamed('login');
                          },
                          child: Text('Back'),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(160, 50)),
                        ),
                        // ElevatedButton(
                        //   onPressed: () async {
                        //     try {
                        //       await FirebaseAuth.instance
                        //           .createUserWithEmailAndPassword(
                        //               email: emailController.text,
                        //               password: passwordController.text);

                        //       if (FirebaseAuth.instance.currentUser == null) {
                        //         try {
                        //           FirebaseAuth.instance
                        //               .signInWithEmailAndPassword(
                        //                   email: emailController.text,
                        //                   password: passwordController.text);
                        //         } on FirebaseAuthException catch (e) {
                        //           print('Failed with error code: ${e.code}');
                        //           print(e.message);
                        //         }
                        //       }

                        //       if (FirebaseAuth.instance.currentUser != null) {
                        //         users
                        //             .doc(FirebaseAuth.instance.currentUser!.uid)
                        //             .set({
                        //           'email': emailController.text,
                        //           'password': passwordController.text,
                        //           'username': usernameController.text,
                        //           'first_name': firstNameController.text,
                        //           'last_name': lastNameController.text
                        //         });
                        //       }

                        //       emailController.text = '';
                        //       passwordController.text = '';
                        //       usernameController.text = '';
                        //       firstNameController.text = '';
                        //       lastNameController.text = '';

                        //       if (!context.mounted) return;
                        //       context.goNamed('nav-page');

                        //     } on FirebaseAuthException catch (e) {
                        //       print('Failed with error code: ${e.code}');
                        //       print(e.message);
                        //     }
                        //   },
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
