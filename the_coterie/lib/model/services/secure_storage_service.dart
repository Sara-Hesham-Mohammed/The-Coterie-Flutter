import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';
  static const _keyRememberMe = 'remember_me';

  // Save credentials
  static Future<void> saveCredentials({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    if (rememberMe) {
      await _storage.write(key: _keyEmail, value: email);
      await _storage.write(key: _keyPassword, value: password);
      await _storage.write(key: _keyRememberMe, value: rememberMe.toString());
    } else {
      await clearCredentials();
    }
  }

  // Get saved credentials
  static Future<Map<String, String?>> getCredentials() async {
    final email = await _storage.read(key: _keyEmail);
    final password = await _storage.read(key: _keyPassword);
    final rememberMe = await _storage.read(key: _keyRememberMe);

    return {
      _keyEmail: email,
      _keyPassword: password,
      _keyRememberMe: rememberMe,
    };
  }

  // Clear saved credentials
  static Future<void> clearCredentials() async {
    await _storage.delete(key: _keyEmail);
    await _storage.delete(key: _keyPassword);
    await _storage.delete(key: _keyRememberMe);
  }
} 