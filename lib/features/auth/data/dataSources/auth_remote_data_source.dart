import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_studying/core/error/exeption.dart';
import 'package:supabase_studying/features/auth/data/model/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> loginWithEmailPassword({
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
  Future<UserModel> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await _supabaseClient.auth
          .signUp(password: password, email: email, data: {'name': name});
      if (response.user == null) {
        throw ServerException('Ошибка с User == null ');
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException('Ошибка ${e.toString()}');
    }
  }

  @override
  Future<UserModel> loginWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }
}
