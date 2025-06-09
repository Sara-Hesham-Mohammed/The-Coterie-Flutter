// Helper classes for seeding
class TestUser {
  final String email;
  final String password;
  final String? displayName;

  TestUser({
    required this.email,
    required this.password,
    this.displayName,
  });
}

class SeedResult {
  final String email;
  final bool success;
  final String message;
  final String? uid;

  SeedResult({
    required this.email,
    required this.success,
    required this.message,
    this.uid,
  });

  @override
  String toString() {
    return 'SeedResult(email: $email, success: $success, message: $message, uid: $uid)';
  }
}