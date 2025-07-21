import 'package:fpdart/fpdart.dart';
import 'package:supabase_studying/core/error/failure.dart';
import 'package:supabase_studying/core/useCases/usecase.dart';
import 'package:supabase_studying/features/auth/domain/entities/user.dart';
import 'package:supabase_studying/features/auth/domain/repository/auth_repository.dart';

class UserSession implements Usecase<User, NoParam> {
  final AuthRepository _authRepository;

  UserSession({required AuthRepository authRepository})
      : _authRepository = authRepository;
  @override
  Future<Either<Failure, User>> call(NoParam param) async {
    return await _authRepository.userSession();
  }
}
