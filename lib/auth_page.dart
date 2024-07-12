import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_studying/main.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

final login = TextEditingController();
final password = TextEditingController();

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Авторизация'),
              Text('Login'),
              TextFormField(
                controller: login,
              ),
              Text('Password'),
              TextFormField(
                controller: password,
              ),
              ElevatedButton(
                onPressed: () async {
                  final AuthResponse res =
                      await supabase.auth.signInWithPassword(
                    email: login.text,
                    password: password.text,
                  );
                  final Session? session = res.session;
                  final User? user = res.user;
                  print('${user?.email}');
                },
                child: Text('Войти'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/regist");
                  },
                  child: Text('Регистрация'))
            ],
          ),
        ),
      )),
    );
  }
}
