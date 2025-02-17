import 'dart:convert';

import 'package:http/http.dart';
import 'package:q_chat/shared/models/user.dart';
import 'package:q_chat/shared/services/services.dart';

class UserService {
  final BaseService _baseService;

  UserService({required baseService}) : _baseService = baseService;

  Future<User> getUserMe() async {
    final response = await _baseService.getData(url: '/api/v1/me');
    return User.fromJson(jsonDecode(response.body));
  }

  Future<User> editUserData(
      {String? username, String? email, String? password}) async {
    final response = await _baseService.getData(url: '/api/v1/me');
    return User.fromJson(jsonDecode(response.body));
  }
}
