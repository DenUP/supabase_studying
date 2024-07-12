import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  Future<void> signUp(String email, String password, String name) async {
    await supabase.auth
        .signUp(
          email: email,
          password: password,
        )
        .then((value) => supabase.from('profile').insert({'name': name}));
  }
}
