import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();
  static const keyEmail = 'email';
  static const keyPassword = 'password';
  static const keyRememberMe = 'remember_me';

  // Save credentials
  static Future<void> saveCredentials({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    if (rememberMe) {
      await _storage.write(key: keyEmail, value: email);
      await _storage.write(key: keyPassword, value: password);
      await _storage.write(key: keyRememberMe, value: rememberMe.toString());
    } else {
      await clearCredentials();
    }
  }

  // Get saved credentials
  static Future<Map<String, String?>> getCredentials() async {
    final email = await _storage.read(key: keyEmail);
    final password = await _storage.read(key: keyPassword);
    final rememberMe = await _storage.read(key: keyRememberMe);

    return {
      keyEmail: email,
      keyPassword: password,
      keyRememberMe: rememberMe,
    };
  }

  // Clear saved credentials
  static Future<void> clearCredentials() async {
    await _storage.delete(key: keyEmail);
    await _storage.delete(key: keyPassword);
    await _storage.delete(key: keyRememberMe);
  }
} 