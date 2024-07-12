import 'package:flutter/material.dart';
import 'package:supabase_studying/domain/repository/supabase_service.dart';

class RegistModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _supabaseService = SupabaseService();

  String? errorMessage;

  bool _isValid(String name, String email, String password) =>
      name.isNotEmpty && email.isNotEmpty && password.isNotEmpty;
  Future<void> regist(BuildContext context) async {
    var name = nameController.text;
    var email = emailController.text;
    var password = passwordController.text;
    if (!_isValid(name, email, password)) {
      errorMessage = 'Введите все поля';
      notifyListeners();
      return;
    }
    try {
      await _supabaseService.signUp(email, password, name);
      notifyListeners();
      errorMessage == null;
    } catch (e) {
      // if (e.)
      errorMessage = '$e';
      notifyListeners();
    }
  }
}
