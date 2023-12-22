import 'package:chat_app/presentation/pages/chat_page.dart';
import 'package:chat_app/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;
  List<Widget> body = const [
    MainPage(),
    ChatPage(),
    Icon(Icons.person)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_rounded), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
    );
  }
}
