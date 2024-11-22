import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_studying/Registration/bloc/registration_bloc.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('Registration')),
        body: BlocListener<RegistrationBloc, RegistrationState>(
          listener: (context, state) {
            if (state is RegistrationSuccess) {
              // Переход на другую страницу или показать сообщение об успехе

              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Registration successful!')));
            } else if (state is RegistrationFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Поле пустое';
                    }
                  },
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Поле пустое';
                    }
                  },
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;
                    context
                        .read<RegistrationBloc>()
                        .add(RegistrationEvent(email, password));
                  },
                  child: Text('Register'),
                ),
                BlocBuilder<RegistrationBloc, RegistrationState>(
                  builder: (context, state) {
                    if (state is RegistrationLoading) {
                      return const CircularProgressIndicator();
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
