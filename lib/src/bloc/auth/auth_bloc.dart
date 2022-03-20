import 'package:bloc/bloc.dart';
import 'package:roleplaying_app/src/models/user.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(UserNotAuthentificated()){
    on<UserLoggedIn>(_onLoggedIn);
    on<UserLoggedOut>(_onLoggedOut);
    on<UserRegistration>(_onRegistration);
  }
  
  void _onLoggedIn(UserLoggedIn event, Emitter<AuthState> emit) {
    emit(UserAuthentificated(event.user));
  }

  void _onLoggedOut(UserLoggedOut event, Emitter<AuthState> emit) {
    emit(UserNotAuthentificated());
  }

  void _onRegistration(UserRegistration event, Emitter<AuthState> emit) {
    emit(UserRegistered(event.user));
  }
}