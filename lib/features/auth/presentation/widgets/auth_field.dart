import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintTitle;
  final TextEditingController controller;
  final bool isObscureText;
  const AuthField(
      {super.key,
      required this.hintTitle,
      required this.controller,
      this.isObscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText,
      controller: controller,
      decoration: InputDecoration(hintText: hintTitle),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Введите $value';
        }
        return null;
      },
    );
  }
}
