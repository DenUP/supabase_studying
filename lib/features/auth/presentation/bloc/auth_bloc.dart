import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_studying/features/auth/domain/entities/user.dart';
import 'package:supabase_studying/features/auth/domain/useCases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc(this._userSignUp) : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      final userId = await _userSignUp(UserSignUpParam(
          name: event.name, email: event.email, password: event.password));
      userId.fold((failure) {
        emit(AuthFailure(textError: failure.text));
      }, (user) {
        emit(AuthLoaded(user: user));
      });
    });
  }
}
