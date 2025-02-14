import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:q_chat/api/iauthentication_api.dart';
import 'package:q_chat/models/models.dart';

class AuthenticationMockApi implements IAuthenticationApi {
  @override
  signUpUsingEmailAndPassword(String email, String password) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final String response =
        await rootBundle.loadString('assets/authentication_response.json');
    final data = await json.decode(response);
    return AuthenticationResponse.fromJson(data);
  }

  @override
  refreshToken(String refreshToken) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final String response =
        await rootBundle.loadString('assets/authentication_response.json');
    final data = await json.decode(response);
    return AuthenticationResponse.fromJson(data);
  }

  @override
  signInUsingEmailAndPassword(String email, String password) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final String response =
        await rootBundle.loadString('assets/authentication_response.json');
    final data = await json.decode(response);
    return AuthenticationResponse.fromJson(data);
  }
  
  @override
  Future<void> signOut(String refreshToken) async {}
}
