part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final UserModel user;

  const AuthState(this.user);

  @override
  List<Object> get props => [user];
}

class UserAuthentificated extends AuthState {
  UserAuthentificated(UserModel user) : super(user);

  @override
  String toString() => 'UserSignedIn {User: $user}';
}

class UserNotAuthentificated extends AuthState {
  UserNotAuthentificated() : super(UserModel.empty);

  @override
  String toString() => 'User not signed in';
}

class UserRegistered extends AuthState {
  const UserRegistered(UserModel user) : super(user);

  @override
  String toString() => 'User registered {User: $user}';
}