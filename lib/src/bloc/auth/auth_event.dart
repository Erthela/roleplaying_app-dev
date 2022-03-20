part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class UserLoggedIn extends AuthEvent {
  const UserLoggedIn({required this.user});
  final UserModel user;
}

class UserLoggedOut extends AuthEvent {
  const UserLoggedOut();
}

class UserRegistration extends AuthEvent {
  const UserRegistration({required this.user});
  final UserModel user;
}