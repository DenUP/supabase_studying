import 'package:flutter/material.dart';
import 'package:supabase_studying/auth_page.dart';
import 'package:supabase_studying/reg_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const AuthPage(),
        '/regist': (context) => const RegPage(),
      },
    );
  }
}
