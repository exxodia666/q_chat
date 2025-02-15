import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:q_chat/shared/models/credentials.dart';

import 'iauth_credentials_service.dart';

class AuthorizationCredentialsService extends IAuthorizationCredentialsService {
  final FlutterSecureStorage storage;
  AuthorizationCredentialsService() : storage = const FlutterSecureStorage();

  @override
  Future<Credentials?> retrieveCredentialsFromSecuredStorage() async {
    String? value = await storage.read(key: 'jwt_credentials');
    print(value);
    return value != null ? Credentials.fromJson(jsonDecode(value)) : null;
  }

  @override
  Future<void> saveCredentialsToSecuredStorage(Credentials credentials) async {
    print('saveCredentialsToSecuredStorage');
    await storage.write(
        key: 'jwt_credentials', value: jsonEncode(credentials.toJson()));
  }

  @override
  Future<void> resetCredentialsInSecuredStorage() async {
    await storage.delete(key: 'jwt_credentials');
  }
}
