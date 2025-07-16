import 'package:fpdart/fpdart.dart';
import 'package:supabase_studying/core/error/exeption.dart';
import 'package:supabase_studying/core/error/failure.dart';
import 'package:supabase_studying/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:supabase_studying/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource authRemoteDataSource})
      : _authRemoteDataSource = authRemoteDataSource;
  @override
  Future<Either<Failure, String>> loginWithEmailPassword(
      {required String name, required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userId = await _authRemoteDataSource.signUpWithEmailPassword(
          name: name, email: email, password: password);

      return Right(userId);
    } on ServerException catch (e) {
      return Left(Failure(e.title));
    }
  }
}
