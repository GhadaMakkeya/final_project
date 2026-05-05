import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:veloura/core/constants/secure_keys.dart';

class SecureStorageServices {
  static const _storage = FlutterSecureStorage();

  Future<void> saveAuthData({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
  }) async {
    await _storage.write(key: SecureKeys.accessToken, value: accessToken);
    await _storage.write(key: SecureKeys.refreshToken, value: refreshToken);
    await _storage.write(
      key: SecureKeys.expiresAt,
      value: expiresAt.toIso8601String(),
    );
  }

  // ✅ FIX: async/await مضاف
  Future<String?> getAccessToken() async {
    return await _storage.read(key: SecureKeys.accessToken);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: SecureKeys.refreshToken);
  }

  Future<DateTime?> getExpiresAt() async {
    final value = await _storage.read(key: SecureKeys.expiresAt);
    return value != null ? DateTime.parse(value) : null;
  }

  Future<void> clearAuthData() async {
    await _storage.delete(key: SecureKeys.accessToken);
    await _storage.delete(key: SecureKeys.refreshToken);
    await _storage.delete(key: SecureKeys.expiresAt);
  }
}