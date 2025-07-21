import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_studying/core/error/exeption.dart';
import 'package:supabase_studying/features/auth/data/model/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Session? get userSession;
  Future<UserModel?> getUserSessionData();
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabaseClient;

  AuthRemoteDataSourceImpl({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;

  @override
  Session? get userSession => _supabaseClient.auth.currentSession;

  @override
  Future<UserModel?> getUserSessionData() async {
    try {
      if (userSession != null) {
        final result = await _supabaseClient
            .from('profiles')
            .select()
            .eq('id', userSession!.user.id);
        return UserModel.fromJson(result.first);
      }
      return null;
    } catch (e) {
      throw ServerException('Ошибка с Б/Д');
    }
  }

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
      {required String email, required String password}) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user == null) {
        throw ServerException('Ошибка с User == null ');
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException('Ошибка ${e.toString()}');
    }
  }
}
