import 'package:doctor_h_appointments_app/shared/local/local_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserDataLocalSource {
  final FlutterSecureStorage _storage;

  UserDataLocalSource({required FlutterSecureStorage storage})
      : _storage = storage;

  Future<void> saveUserInformation({required String userInformation}) async {
    await _storage.write(
        key: LocalConstants.userInformationStorageKey, value: userInformation);
  }

  Future<String?> getUserInformation() async {
    return await _storage.read(key: LocalConstants.userInformationStorageKey);
  }
}
