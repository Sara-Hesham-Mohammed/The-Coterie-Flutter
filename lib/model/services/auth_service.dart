import 'package:firebase_auth/firebase_auth.dart';
import 'secure_storage_service.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService({FirebaseAuth? auth})
      : _firebaseAuth = auth ?? FirebaseAuth.instance;

  User? currentUser() {
    return _firebaseAuth.currentUser;
  }

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<bool> signIn({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    try {
      final UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user != null) {
        // Only save credentials if login was successful
        if (rememberMe) {
          await SecureStorageService.saveCredentials(
            email: email,
            password: password,
            rememberMe: rememberMe,
          );
        }
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      String message = 'An error occurred during sign in';
      switch (e.code) {
        case 'user-not-found':
          message = 'No user found with this email';
          break;
        case 'wrong-password':
          message = 'Wrong password provided';
          break;
        case 'invalid-email':
          message = 'The email address is invalid';
          break;
        case 'user-disabled':
          message = 'This user account has been disabled';
          break;
      }
      throw Exception(message);
    } catch (e) {
      throw Exception('Failed to sign in: ${e.toString()}');
    }
  }

  Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;

      if (user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Error registering: $e');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await SecureStorageService.clearCredentials();
  }

  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      print('Password reset email sent to $email');
    } catch (e) {
      print('Error sending reset email: $e');
    }
  }

  // Try to sign in with saved credentials
  Future<bool> tryAutoSignIn() async {
    final credentials = await SecureStorageService.getCredentials();
    final email = credentials[SecureStorageService.keyEmail];
    final password = credentials[SecureStorageService.keyPassword];
    final rememberMe =
        credentials[SecureStorageService.keyRememberMe] == 'true';

    if (email != null && password != null && rememberMe) {
       signIn(
        email: email,
        password: password,
        rememberMe: true,
      );
       return true;
    }
    else {
      return false;
    }
  }
}
