part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  UserModel? user;

  AuthState(this.user);
  AuthState.noUser();

  @override
  List<Object> get props => [];
}

class AutStateInit extends AuthState {
  AutStateInit.noUser() : super.noUser();
}

class AuthStateAuthetificated extends AuthState {
  AuthStateAuthetificated(UserModel user) : super(user);

  @override
  String toString() => 'UserSignedIn {User: $user}';
}

class AuthStateNotAuthentificated extends AuthState {
  AuthStateNotAuthentificated() : super(UserModel.empty);

  @override
  String toString() => 'User not signed in';
}