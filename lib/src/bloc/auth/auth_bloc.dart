import 'package:bloc/bloc.dart';
import 'package:roleplaying_app/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:roleplaying_app/src/services/auth_service.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  // UserModel userModel;

  AuthBloc({required AuthService authService})
      : _authService = authService,
        // userModel = UserModel.empty,
        super(AutStateInit.noUser()){
    on<UserLoggedIn>(_onLoggedIn);
    on<UserLoggedOut>(_onLoggedOut);
    on<UserInit>(_onStarted);
  }


  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AutStateInit) {
      yield* _mapAuthInitToState();
    } else if (event is AuthStateAuthetificated) {
      yield* _mapAuthLogInToState();
    } else if (event is AuthStateNotAuthentificated) {
      yield* _mapAuthLogOutToState();
    }
  }

  Stream<AuthState> _mapAuthInitToState() async* {
    final isSignedIn = await _authService.isSignedIn();
    if (isSignedIn) {
      final user = await _authService.getUserFromFirebase();
      yield AuthStateAuthetificated(user);
    }
    else {
      yield AuthStateNotAuthentificated();
    }
  }

  Stream<AuthState> _mapAuthLogInToState() async* {
    yield AuthStateAuthetificated(await _authService.getUserFromFirebase());
  }

  Stream<AuthState> _mapAuthLogOutToState() async* {
    yield AuthStateNotAuthentificated();
    _authService.logOut();
  }

  void _onStarted(UserInit event, Emitter<AuthState> emit) {
    emit(AutStateInit.noUser());
    print("Starting log in");
  }
  
  void _onLoggedIn(UserLoggedIn event, Emitter<AuthState> emit) {
    emit(AuthStateAuthetificated(event.user));
    print("Logged in");
  }

  void _onLoggedOut(UserLoggedOut event, Emitter<AuthState> emit) {
    emit(AuthStateNotAuthentificated());
    print("Logged out");
  }
}