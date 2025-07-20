import 'package:fpdart/fpdart.dart';
import 'package:supabase_studying/core/error/failure.dart';
import 'package:supabase_studying/core/useCases/usecase.dart';
import 'package:supabase_studying/features/auth/domain/entities/user.dart';
import 'package:supabase_studying/features/auth/domain/repository/auth_repository.dart';

class UserLogin implements Usecase<User, UserLoginParam> {
  final AuthRepository _authRepository;

  UserLogin({required AuthRepository authRepository})
      : _authRepository = authRepository;
  @override
  Future<Either<Failure, User>> call(UserLoginParam param) {
    return _authRepository.loginWithEmailPassword(
        email: param.email, password: param.password);
  }
}

class UserLoginParam {
  final String email;
  final String password;

  UserLoginParam({required this.email, required this.password});
}
