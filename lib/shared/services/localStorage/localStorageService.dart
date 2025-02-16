import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:localstorage/localstorage.dart';

class LocalStorageService extends FlutterSecureStorage {
  @override
  delete(
      {AndroidOptions? aOptions,
      IOSOptions? iOptions,
      required String key,
      LinuxOptions? lOptions}) async {
    localStorage.removeItem(key);
  }

  @override
  Future<String?> read(
      {AndroidOptions? aOptions,
      IOSOptions? iOptions,
      required String key,
      LinuxOptions? lOptions}) async {
    return localStorage.getItem(key);
  }

  @override
  Future<void> write(
      {AndroidOptions? aOptions,
      IOSOptions? iOptions,
      required String key,
      LinuxOptions? lOptions,
      required String? value}) async {
    localStorage.setItem(key, value ?? '');
  }
}
