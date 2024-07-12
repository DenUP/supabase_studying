import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_studying/Auth/auth_model.dart';
import 'package:supabase_studying/main.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthModel(),
      child: const SubAuthPage(),
    );
  }
}

class SubAuthPage extends StatelessWidget {
  const SubAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthModel>();
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text('fasdfdsfsd'),
            model.errorMessage != null
                ? Text(
                    '${model.errorMessage}',
                    style: const TextStyle(color: Colors.red),
                  )
                : const SizedBox.shrink(),
            const Text('Single'),
            TextFormField(
              controller: model.loginController,
            ),
            TextFormField(
              controller: model.passwordController,
            ),
            ElevatedButton(
                onPressed: () => model.auth(context),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.amber),
                )),
            Registr()
          ],
        ),
      ))),
    );
  }
}

class Registr extends StatelessWidget {
  const Registr({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();
    return ElevatedButton(
        onPressed: () async {
          Navigator.of(context).pushNamed('/regist');
          // final authResponse = await supabase.auth.signUp(
          //   password: model.loginController.text,
          //   email: model.passwordController.text,
          // );
          // print('${authResponse.user?.email}');
        },
        child: const Text('Regist'));
  }
}
