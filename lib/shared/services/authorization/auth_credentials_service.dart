import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:q_chat/shared/models/credentials.dart';

import 'iauth_credentials_service.dart';

class AuthorizationCredentialsService extends IAuthorizationCredentialsService {
  final FlutterSecureStorage _storage;
  AuthorizationCredentialsService({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  @override
  Future<Credentials?> retrieveCredentialsFromSecuredStorage() async {
    String? value = await _storage.read(key: 'jwt_credentials');
    return value != null ? Credentials.fromJson(jsonDecode(value)) : null;
  }

  @override
  Future<void> saveCredentialsToSecuredStorage(Credentials credentials) async {
    print(
        'saveCredentialsToSecuredStorage: ${jsonEncode(credentials.toJson())}');
    await _storage.write(
        key: 'jwt_credentials', value: jsonEncode(credentials.toJson()));
  }

  @override
  Future<void> resetCredentialsInSecuredStorage() async {
    await _storage.delete(key: 'jwt_credentials');
  }
}
