import 'dart:async';

import 'package:q_chat/shared/models/models.dart';
import 'package:q_chat/shared/services/services.dart';

class AuthCredentialsRepository {
  AuthCredentialsRepository({
    required authCredService,
  }) : _authorizationCredentialsService = authCredService;

  final IAuthorizationCredentialsService _authorizationCredentialsService;

  Future<Credentials?> getCredentials() async {
    final Credentials? response = await _authorizationCredentialsService
        .retrieveCredentialsFromSecuredStorage();
    return response;
  }

  Future<void> saveCredentials({
    required Credentials credentials,
  }) async {
    await _authorizationCredentialsService
        .saveCredentialsToSecuredStorage(credentials);
  }

  Future<void> deleteCredentials() async {
    await _authorizationCredentialsService.resetCredentialsInSecuredStorage();
  }
}
