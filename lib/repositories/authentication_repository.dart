import 'dart:async';

import 'package:q_chat/api/authentication_mock_api.dart';
import 'package:q_chat/api/iauthentication_api.dart';
import 'package:q_chat/models/models.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository({
    IAuthenticationApi? authApi,
  }) : authenticationApi = authApi ?? AuthenticationMockApi();

  final IAuthenticationApi authenticationApi;

  Future<Credentials> logIn({
    required String email,
    required String password,
  }) async {
    final AuthenticationResponse response =
        await authenticationApi.signInUsingEmailAndPassword(email, password);
    return response.credentials;
  }
}
