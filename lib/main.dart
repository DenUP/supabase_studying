import 'package:flutter/material.dart';
import 'package:supabase_studying/core/secret/app_key.dart';
import 'package:supabase_studying/core/theme/app_theme.dart';
import 'package:supabase_studying/features/auth/presentation/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase =
      await Supabase.initialize(url: AppKey.url, anonKey: AppKey.anonkey);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Supabase',
      theme: AppTheme.themeDark,
      home: LoginPage(),
    );
  }
}
