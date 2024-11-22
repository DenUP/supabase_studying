// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'registration_bloc.dart';

class RegistrationEvent extends Equatable {
  final String email;
  final String password;
  const RegistrationEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
