import 'dart:async';
import 'package:q_chat/shared/models/user.dart';
import 'package:q_chat/shared/services/user/user_service.dart';
import 'package:q_chat/shared/services/services.dart';

enum UserStatus { unknown, authenticated, unauthenticated }

class UserRepository {
  UserRepository({UserService? userService, required BaseService baseService})
      : _userService = userService ?? UserService(baseService: baseService);

  final UserService _userService;

  Future<User> getUserMe() async {
    final User user = await _userService.getUserMe();
    return user;
  }

  Future<User> editUserData(
      {String? userName, String? email, String? password}) async {
    final User user = await _userService.getUserMe();
    return user;
  }
}
