import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_studying/Auth/auth_model.dart';
import 'package:supabase_studying/Auth/auth_page.dart';
import 'package:supabase_studying/registr/regist_model.dart';
import 'package:supabase_studying/registr/regist_widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const AuthPage(),
        '/regist': (context) => const RegistWidget(),
      },
    );
  }
}
