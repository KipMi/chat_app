import 'package:chat_app/presentation/widgets/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // color: Colors.amber,
              height: 300,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InputField(
                      controller: emailController, labelText: 'E - Mail', ),
                  InputField(
                      controller: passwordController, labelText: 'Password', obscure: true,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);

                            if (FirebaseAuth.instance.currentUser != null) {
                              context.goNamed('nav-page');
                            }
                          } on FirebaseAuthException catch (e) {
                            print(e.message);
                          }
                        },
                        child: Text('Login'),
                        style:
                            ElevatedButton.styleFrom(fixedSize: Size(160, 50)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.goNamed('register');
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(160, 50)),
                        child: const Text('Register'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
