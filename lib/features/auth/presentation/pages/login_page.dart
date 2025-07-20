import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_studying/core/common/widgets/loader.dart';
import 'package:supabase_studying/core/theme/app_color.dart';
import 'package:supabase_studying/core/utils/show_snack_bar.dart';
import 'package:supabase_studying/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_studying/features/auth/presentation/pages/signup_page.dart';
import 'package:supabase_studying/features/auth/presentation/widgets/auth_field.dart';
import 'package:supabase_studying/features/auth/presentation/widgets/auth_gradient_button.dart';

class LoginPage extends StatefulWidget {
  static route(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
  }

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              return showSnackBar(context, state.textError);
            }
            if (state is AuthLoaded) {
              return showSnackBar(context, 'Авторизовался');
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }
            return Form(
              key: keyForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Вход',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
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
                  AuthGradientButton(
                    title: 'Войти',
                    voidCallback: () {
                      if (keyForm.currentState!.validate()) {
                        context.read<AuthBloc>().add(LoginEvent(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim()));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      SignupPage.route(context);
                    },
                    child: RichText(
                      text: TextSpan(
                          text: 'У вас нет аккаунта?  ',
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                            TextSpan(
                                text: 'Зарегистрироваться',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: AppColor.gradient2))
                          ]),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
