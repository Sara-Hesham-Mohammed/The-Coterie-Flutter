import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _userEmailKey = 'userEmail';
  static const String _rememberMeKey = 'rememberMe';

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Stream of auth state changes
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Get current user
  User? currentUser() => _firebaseAuth.currentUser;

  // Sign in method
  Future<bool> signIn({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        // Save login state to SharedPreferences
        await _saveLoginState(
          email: email,
          rememberMe: rememberMe,
        );
        return true;
      }
      return false;
    } catch (e) {
      print('Sign in error: $e');
      throw e;
    }
  }

  // Sign up method
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        // Save login state after successful signup
        await _saveLoginState(
          email: email,
          rememberMe: true, // Default to true for new signups
        );
      }
    } catch (e) {
      print('Sign up error: $e');
      throw e;
    }
  }

  // Sign out method
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      // Clear saved login state
      await _clearLoginState();
    } catch (e) {
      print('Sign out error: $e');
      throw e;
    }
  }

  // Try auto sign in using saved credentials
  Future<User?> tryAutoSignIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool(_isLoggedInKey) ?? false;
      final rememberMe = prefs.getBool(_rememberMeKey) ?? false;

      // Only auto sign in if user chose to be remembered
      if (isLoggedIn && rememberMe) {
        // Firebase handles persistence automatically, just return current user
        final user = _firebaseAuth.currentUser;
        if (user != null) {
          print('Auto sign in successful for: ${user.email}');
          return user;
        } else {
          // User data exists in SharedPreferences but not in Firebase
          // This might happen if Firebase session expired
          await _clearLoginState();
        }
      }
      return null;
    } catch (e) {
      print('Auto sign in failed: $e');
      await _clearLoginState();
      return null;
    }
  }

  // Check if user should stay logged in
  Future<bool> shouldStayLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool(_isLoggedInKey) ?? false;
    final rememberMe = prefs.getBool(_rememberMeKey) ?? false;
    return isLoggedIn && rememberMe;
  }

  // Get saved user email
  Future<String?> getSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmailKey);
  }

  // Private method to save login state
  Future<void> _saveLoginState({
    required String email,
    required bool rememberMe,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, true);
    await prefs.setString(_userEmailKey, email);
    await prefs.setBool(_rememberMeKey, rememberMe);
    print('Login state saved - Email: $email, RememberMe: $rememberMe');
  }

  // Private method to clear login state
  Future<void> _clearLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isLoggedInKey);
    await prefs.remove(_userEmailKey);
    await prefs.remove(_rememberMeKey);
    print('Login state cleared');
  }
}