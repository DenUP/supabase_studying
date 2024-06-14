import 'package:flutter/material.dart';
import 'package:supabase_studying/UI/widgets/notes_main.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const NotesMain(),
      },
    );
  }
}
