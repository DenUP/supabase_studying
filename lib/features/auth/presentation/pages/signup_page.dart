import 'package:flutter/material.dart';
import 'package:supabase_studying/core/theme/app_color.dart';
import 'package:supabase_studying/features/auth/presentation/pages/login_page.dart';
import 'package:supabase_studying/features/auth/presentation/widgets/auth_field.dart';
import 'package:supabase_studying/features/auth/presentation/widgets/auth_gradient_button.dart';

class SignupPage extends StatefulWidget {
  static route(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignupPage(),
        ));
  }

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Регистрация',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              AuthField(
                hintTitle: 'Имя',
                controller: _nameController,
              ),
              const SizedBox(
                height: 15,
              ),
              AuthField(
                hintTitle: 'Email',
                controller: _emailController,
              ),
              const SizedBox(
                height: 15,
              ),
              AuthField(
                hintTitle: 'Пароль',
                controller: _passwordController,
                isObscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              const AuthGradientButton(title: 'Зарегистрироваться'),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () => LoginPage.route(context),
                child: RichText(
                  text: TextSpan(
                      text: 'У вас есть аккаунт?  ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text: 'Войти',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: AppColor.gradient2))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
