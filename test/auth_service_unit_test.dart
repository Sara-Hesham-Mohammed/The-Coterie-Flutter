import 'package:flutter_test/flutter_test.dart';
import 'package:the_coterie/model/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_coterie/firebase_options.dart';

void main() async {
  late AuthService authService;

  setUpAll(() async {
    // Initialize Flutter
    WidgetsFlutterBinding.ensureInitialized();
    // Initialize Firebase with the default options
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  });

  setUp(() {
    authService = AuthService(); // This will use the real Firebase Auth instance
  });

  group('AuthService - Real Firebase Tests', () {
    test('sign up with new email should succeed', () async {
      // Generate a unique email for testing
      final testEmail = 'test${DateTime.now().millisecondsSinceEpoch}@example.com';
      final testPassword = 'Test123!';

      final result = await authService.signUp(
        email: testEmail,
        password: testPassword,
      );

      expect(result, true);
      
      // Clean up - sign out
      await authService.signOut();
    });

    test('sign up with invalid email should fail', () async {
      expect(
        () => authService.signUp(
          email: 'invalid-email',
          password: 'Test123!',
        ),
        throwsException,
      );
    });

    test('sign up with weak password should fail', () async {
      expect(
        () => authService.signUp(
          email: 'test@example.com',
          password: '123', // weak password
        ),
        throwsException,
      );
    });
  });
} 