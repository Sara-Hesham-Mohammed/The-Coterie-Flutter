import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? currentUser() {
    return _firebaseAuth.currentUser;
  }

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<User?> signIn({required String email, required String password}) async {
    try{
      UserCredential credential =  await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user;
    } catch (e) {
      // Handle the case where the email is already in use or other errors
      throw Exception('Error checking email: $e');
    }
  }

  Future<bool> signUp({
    required String email,
    required String password,
  }) async {

    try{
      UserCredential credential =  await _firebaseAuth.createUserWithEmailAndPassword(
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
  }


}
