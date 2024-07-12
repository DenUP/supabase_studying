import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_studying/main.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

final email = TextEditingController();
final password = TextEditingController();

class _RegPageState extends State<RegPage> {
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
            Text('Регистрация'),
            // Login
            TextFormField(
              controller: email,
            ),
            // Password
            TextFormField(
              controller: password,
            ),
            ElevatedButton(
                onPressed: () async {
                  final AuthResponse res = await supabase.auth.signUp(
                    email: email.text,
                    password: password.text,
                  );
                },
                child: Text('Зарегистрироваться'))
          ],
        ),
      ))),
    );
  }
}
