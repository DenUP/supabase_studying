part of 'registration_bloc.dart';

sealed class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

final class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationSuccess extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationFailure extends RegistrationState {
  final String error;

  const RegistrationFailure(this.error);

  @override
  List<Object> get props => [error];
}
