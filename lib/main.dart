import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_studying/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://lkdwznwonjkgvyqxmeia.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxrZHd6bndvbmprZ3Z5cXhtZWlhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjA3Njk0MzksImV4cCI6MjAzNjM0NTQzOX0.avOOamDujKczWJTCNK2mGIuRXcFgDXj0E7d6H2fXY08',
  );

  runApp(const App());
}

// Get a reference your Supabase client

