import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  SecureStorageFactory._();

  static FlutterSecureStorage? _storage;

  static getStorage() {
    if (_storage == null) {
      _storage = const FlutterSecureStorage();
      return _storage;
    } else {
      return _storage;
    }
  }
}
