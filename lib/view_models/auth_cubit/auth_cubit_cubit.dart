import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/services/auth_service.dart';
import 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService = AuthService();

  AuthCubit() : super(AuthInitial()) {
    _initializeAuth();
  }

  void _initializeAuth() {
    // Listen to Firebase auth state changes
    _authService.authStateChanges.listen((user) {
      if (user == null) {
        emit(Unauthenticated());
      } else {
        emit(Authenticated());
      }
    });
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
      // The auth state listener will automatically emit Authenticated
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      emit(AuthLoading());
      await _authService.signOut();
    } catch (e) {
      emit(AuthError('Sign out failed: ${e.toString()}'));
    }
  }

  void checkAuth() async {
    try {
      emit(AuthLoading());

      // First check if there's a current Firebase user
      final currentUser = _authService.currentUser();

      if (currentUser != null) {
        // User is already signed in to Firebase
        print('User is authenticated: ${currentUser.email}');
        emit(Authenticated());
      } else {
        // Try auto sign in using saved preferences
        final user = await _authService.tryAutoSignIn();
        if (user != null) {
          print('Auto sign in successful: ${user.email}');
          emit(Authenticated());
        } else {
          print('User is not authenticated');
          emit(Unauthenticated());
        }
      }
    } catch (e) {
      print('Check auth failed: $e');
      emit(Unauthenticated());
    }
  }

  Future<void> tryAutoSignIn() async {
    try {
      // Check if user should stay logged in
      final shouldStay = await _authService.shouldStayLoggedIn();

      if (shouldStay) {
        final user = await _authService.tryAutoSignIn();
        if (user != null) {
          emit(Authenticated());
        } else {
          emit(Unauthenticated());
        }
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      print('Auto sign in failed: $e');
      emit(Unauthenticated());
    }
  }

  // Get saved email for pre-filling login form
  Future<String?> getSavedEmail() async {
    return await _authService.getSavedEmail();
  }
}