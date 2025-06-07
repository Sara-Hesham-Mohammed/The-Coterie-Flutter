import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/services/auth_service.dart';
import 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;
  AuthCubit(this._authService) : super(AuthInitial()) {
    _authService.authStateChanges.listen((user) {
      emit(user == null ? Unauthenticated() : Authenticated());
    });
  }

  void signIn(String email, String password) async {
    try {
      emit(AuthLoading());
      await _authService.signIn(email: email, password: password);
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void signUp(String email, String password) async {
    try {
      emit(AuthLoading());
      await _authService.signUp(email: email, password: password);
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void signOut() async {
    await _authService.signOut();
  }
}
