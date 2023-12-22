import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FirebaseAuth fireAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference user = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Main Page')),
      body: Container(
        width: sizeWidth,
        height: sizeHeight,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                width: sizeWidth,
                height: sizeHeight * 0.2,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 3, spreadRadius: 1, color: Colors.black38)
                ], color: Colors.white),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (FirebaseAuth.instance.currentUser != null) {
                                FirebaseAuth.instance.signOut();
                                context.goNamed('login');
                              }
                            },
                            child: const Text('Sign Out'))
                      ],
                    ),
                    FutureBuilder(
                        future: user.doc(fireAuth.currentUser?.uid).get(),
                        builder: (_, snapshot) {
                          if (snapshot.hasData) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Text(
                              '${data['first_name']} ${data['last_name']}',
                              style: const TextStyle(fontSize: 18),
                            );
                          } else {
                            return const Text('Loading');
                          }
                        })
                  ],
                ),
              ),
              Container(
                height: sizeHeight * 0.5,
                width: sizeWidth,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Friends',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
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
