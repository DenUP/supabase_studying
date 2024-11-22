import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_studying/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://nkjwrfzbmvvzktacdams.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5randyZnpibXZ2emt0YWNkYW1zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIyODAzODMsImV4cCI6MjA0Nzg1NjM4M30.qaonYti0uLdoVIFiUo-EHg4u-FpBiNKOZOybgUQrh5g',
  );

  runApp(const App());
}
