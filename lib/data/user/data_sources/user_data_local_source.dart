import 'package:doctor_h_appointments_app/shared/local/local_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserDataLocalSource {
  final FlutterSecureStorage _storage;

  UserDataLocalSource({required FlutterSecureStorage storage})
      : _storage = storage;

  Future<void> saveUserPreferences({required String userPreferences}) async {
    await _storage.write(
        key: LocalConstants.userPreferencesStorageKey, value: userPreferences);
  }

  Future<String?> getUserPreferences() async {
    return await _storage.read(key: LocalConstants.userPreferencesStorageKey);
  }
}
