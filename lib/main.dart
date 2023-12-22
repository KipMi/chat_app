import 'package:chat_app/presentation/pages/chatting_page.dart';
import 'package:chat_app/presentation/pages/login_page.dart';
import 'package:chat_app/presentation/pages/main_page.dart';
import 'package:chat_app/presentation/pages/navigation_page.dart';
import 'package:chat_app/presentation/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) {
            return LoginPage();
          }),
      GoRoute(
        path: '/',
        name: 'nav-page',
        builder: (context, state) {
          return NavigationPage();
        },
      ),
      GoRoute(path: '/register',
        name: 'register',
        builder: (context, state) {
          return RegisterPage();
        },
      ),
      GoRoute(path: '/chatting',
        name: 'chatting',
        builder: (context, state) {
          return ChattingPage();
        }
      )
    ],
    initialLocation: '/login',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
