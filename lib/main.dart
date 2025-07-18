import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_studying/core/theme/app_theme.dart';
import 'package:supabase_studying/dependecy_injection.dart';
import 'package:supabase_studying/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_studying/features/auth/presentation/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => getIt.get<AuthBloc>(),
    ),
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Supabase',
      theme: AppTheme.themeDark,
      home: const LoginPage(),
    );
  }
}
