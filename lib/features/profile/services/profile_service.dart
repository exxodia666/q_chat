import 'dart:convert';

import 'package:q_chat/features/profile/models/user.dart';
import 'package:q_chat/shared/services/services.dart';

class ProfileService {
  final BaseService _baseService;

  ProfileService({required baseService}) : _baseService = baseService;

  Future<User> getUserProfile() async {
    final res = await _baseService.getData(url: '/api/v1/me');
    return User.fromJson(jsonDecode(res.body));
  }
}
