import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:the_coterie/model/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_coterie/firebase_options.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late AuthService authService;

  setUpAll(() async {
    // Initialize Firebase with the default options
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  });

  setUp(() {
    authService = AuthService(); // This will use the real Firebase Auth instance
  });

  group('AuthService - Real Firebase Integration Tests', () {
    // testWidgets('sign up with new email should succeed', (tester) async {
    //   // Generate a unique email for testing
    //   final testEmail = 'test${DateTime.now().millisecondsSinceEpoch}@example.com';
    //   final testPassword = 'Test123!';
    //
    //   print('About to call signUp...');
    //
    //   try {
    //     final result = await authService.signUp(
    //       email: testEmail,
    //       password: testPassword,
    //     );
    //
    //     print('SignUp result: $result');
    //     expect(result, true);
    //   } catch (e, stackTrace) {
    //     print('Test caught error: $e');
    //     print('Stack trace: $stackTrace');
    //     rethrow;
    //   }
    //
    //   // Clean up - sign out
    //   await authService.signOut();
    // });

    testWidgets('sign up with invalid email should fail', (tester) async {
      expect(
        () => authService.signUp(
          email: 'invalid-email',
          password: 'Test123!',
        ),
        throwsException,
      );
    });

    testWidgets('sign up with weak password should fail', (tester) async {
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