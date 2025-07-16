import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_studying/core/error/exeption.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<String> loginWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabaseClient;

  AuthRemoteDataSourceImpl({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;
  @override
  Future<String> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await _supabaseClient.auth
          .signUp(password: password, email: email, data: {'name': name});
      if (response.user == null) {
        throw ServerException('Ошибка с User == null ');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException('Ошибка ${e.toString()}');
    }
  }

  @override
  Future<String> loginWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }
}
