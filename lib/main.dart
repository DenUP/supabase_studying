import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_studying/app.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://zdeimpmekezpkypnpssb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpkZWltcG1la2V6cGt5cG5wc3NiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgzNzk0MzksImV4cCI6MjAzMzk1NTQzOX0.m5kaZ6CKoQZCHTE0b-pB7m4ifFmJT5tEJ6Z555dPdlY',
  );

  runApp(const App());
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;
