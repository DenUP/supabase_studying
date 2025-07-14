import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_studying/app.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://trxqfvmucjoobomlfbwx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRyeHFmdm11Y2pvb2JvbWxmYnd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjA3NzI0MjIsImV4cCI6MjAzNjM0ODQyMn0.eX9l2kDDqL5AEXxDpjfMuUiaWZECo2SU2Q5ov4L446E',
  );

  runApp(const App());
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;

