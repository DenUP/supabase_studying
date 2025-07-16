import 'package:fpdart/fpdart.dart';
import 'package:supabase_studying/core/error/failure.dart';
import 'package:supabase_studying/core/useCases/usecase.dart';
import 'package:supabase_studying/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements Usecase<String, UserSignUpParam> {
  final AuthRepository _authRepository;

  UserSignUp({required AuthRepository authRepository})
      : _authRepository = authRepository;
  @override
  Future<Either<Failure, String>> call(UserSignUpParam param) async {
    return await _authRepository.signUpWithEmailPassword(
        name: param.name, email: param.email, password: param.password);
  }
}

class UserSignUpParam {
  final String name;
  final String email;
  final String password;

  UserSignUpParam(
      {required this.name, required this.email, required this.password});
}
