import 'package:fpdart/fpdart.dart';
import 'package:supabase_studying/core/error/failure.dart';

abstract interface class Usecase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}
