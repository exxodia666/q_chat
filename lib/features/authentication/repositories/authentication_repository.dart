import 'dart:async';

import 'package:q_chat/features/authentication/services/services.dart';
import 'package:q_chat/shared/models/models.dart';
import 'package:q_chat/shared/services/services.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository(
      {IAuthenticationService? authService, required BaseService baseService})
      : authenticationService =
            authService ?? AuthenticationService(baseService: baseService);

  final IAuthenticationService authenticationService;

  Future<Credentials> logIn({
    required String email,
    required String password,
  }) async {
    final Credentials response = await authenticationService
        .signInUsingEmailAndPassword(email, password);
    print(response);
    return response;
  }

  Future<Credentials> signUp({
    required String email,
    required String password,
  }) async {
    final Credentials response = await authenticationService
        .signUpUsingEmailAndPassword(email, password);
    return response;
  }

  Future<void> logOut() async {
    await authenticationService.signOut();
  }
}
