import 'dart:convert';

import 'package:q_chat/features/authentication/authentication.dart';
import 'package:q_chat/shared/models/models.dart';
import 'package:q_chat/shared/services/services.dart';

class AuthenticationService extends IAuthenticationService {
  final BaseService _baseService;

  AuthenticationService({required baseService}) : _baseService = baseService;
  @override
  Future<Credentials> refreshToken(String refresh_token) async {
    final res = await _baseService.postData(body: {}, url: 'url');
    return jsonDecode(res.body);
  }

  @override
  Future<Credentials> signInUsingEmailAndPassword(
      String email, String password) async {
    print('signing');
    final res = await _baseService.postData(body: {
      "email": email,
      "password": password,
      "session_name": "r823rh8723hr2"
    }, url: '/api/v1/signin');
    print('Signing ${res.body}');
    var decodedResponse = Credentials.fromJson(jsonDecode(res.body));
    print('decodedResponse: $decodedResponse');
    return decodedResponse;
  }

  @override
  Future<void> signOut() async {
    await _baseService.deleteData(url: 'api/v1/signout');
  }

  @override
  Future<Credentials> signUpUsingEmailAndPassword(
      String email, String password) async {
    final res = await _baseService.postData(
        body: {"email": email, "username": email, "password": password},
        url: '/api/v1/signup');
    return jsonDecode(res.body);
  }
}
