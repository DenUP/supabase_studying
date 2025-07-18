import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_studying/core/secret/app_key.dart';
import 'package:supabase_studying/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:supabase_studying/features/auth/data/repository/auth_repository_impl.dart';
import 'package:supabase_studying/features/auth/domain/repository/auth_repository.dart';
import 'package:supabase_studying/features/auth/domain/useCases/user_sign_up.dart';
import 'package:supabase_studying/features/auth/presentation/bloc/auth_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  _authInit();
  final supabase =
      await Supabase.initialize(url: AppKey.url, anonKey: AppKey.anonkey);
  getIt.registerLazySingleton(() => supabase.client);
}

void _authInit() {
  getIt.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(supabaseClient: getIt()));

  getIt.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: getIt()));
  getIt.registerFactory(() => UserSignUp(authRepository: getIt()));
  // Bloc
  getIt.registerLazySingleton(() => AuthBloc(getIt()));
}
