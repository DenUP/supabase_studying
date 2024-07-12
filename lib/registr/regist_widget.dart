import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_studying/main.dart';
import 'package:supabase_studying/registr/regist_model.dart';

class RegistWidget extends StatelessWidget {
  const RegistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegistModel(),
      child: const SubRegistWidget(),
    );
  }
}

class SubRegistWidget extends StatelessWidget {
  const SubRegistWidget({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegistModel>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                model.errorMessage != null
                    ? Text(
                        "${model.errorMessage}",
                        style: TextStyle(color: Colors.red),
                      )
                    : const SizedBox.shrink(),
                const Text(
                  'Регистрация',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const Text(
                    'Заполните Свои данные или продолжите через социальные медиа'),
                Text('NAME'),
                TextFormField(
                  controller: model.nameController,
                ),
                Text('EMAIL'),
                TextFormField(controller: model.emailController),
                Text('PASSword'),
                TextFormField(controller: model.passwordController),
                ElevatedButton(
                    // onPressed: () => model.regist(context),
                    onPressed: () => model.regist(context),
                    child: const Text('Regist'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
