import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_studying/domain/repository/supabase_service.dart';
import 'package:supabase_studying/main.dart';

class AuthModel extends ChangeNotifier {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  String? errorMessage;

  bool _isValid(String login, String password) =>
      login.isNotEmpty && password.isNotEmpty;

  void auth(BuildContext context) async {
    var login = loginController.text;
    var password = passwordController.text;
    if (!_isValid(login, password)) {
      errorMessage = 'Пустые поля';
      notifyListeners();
      return;
    }
    errorMessage = null;
    notifyListeners();
    // try {
    //   final res = await supabase.auth.signInWithPassword(
    //     email: login,
    //     password: password,
    //   );
    //   ScaffoldMessenger(child: SnackBar(content: Text('${res.user?.email}')));

    //   errorMessage = 'Заебок';
    //   notifyListeners();
    // } catch (e) {
    //   errorMessage = '$e';
    //   notifyListeners();
    // }
  }
}
