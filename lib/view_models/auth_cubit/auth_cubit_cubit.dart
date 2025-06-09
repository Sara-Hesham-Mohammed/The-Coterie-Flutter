import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/services/auth_service.dart';
import 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService = AuthService();

  AuthCubit() : super(AuthInitial()) {
    _authService.authStateChanges.listen((user) {
      emit(user == null ? Unauthenticated() : Authenticated());
    });
    // Try auto sign in when cubit is created
    tryAutoSignIn();
  }

  void signIn(String email, String password, {bool rememberMe = false}) async {
    try {
      emit(AuthLoading());
      final success = await _authService.signIn(
        email: email,
        password: password,
        rememberMe: rememberMe,
      );
      if (success) {
        emit(Authenticated());
      } else {
        emit(AuthError('Login failed'));
      }
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

  void checkAuth() {
    final user = _authService.currentUser();
    if (user != null) {
      print('User is authenticated: ${user.email}');
      emit(Authenticated());
    } else {
      print('User is not authenticated');
      emit(Unauthenticated());
    }
  }

  Future<void> tryAutoSignIn() async {
    try {
      final user = await _authService.tryAutoSignIn();
      if (user != null) {
        emit(Authenticated());
      }
    } catch (e) {
      print('Auto sign in failed: $e');
    }
  }
}
