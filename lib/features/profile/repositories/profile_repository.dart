import 'dart:async';

import 'package:q_chat/features/profile/models/user.dart';
import 'package:q_chat/features/profile/services/profile_service.dart';
import 'package:q_chat/shared/services/services.dart';

enum ProfileStatus { unknown, authenticated, unauthenticated }

class ProfileRepository {
  ProfileRepository(
      {ProfileService? profileService, required BaseService baseService})
      : _profileService =
            profileService ?? ProfileService(baseService: baseService);

  final ProfileService _profileService;

  Future<User> getUserMe() async {
    final User response = await _profileService.getUserProfile();
    print('logInResponse: $response');
    return response;
  }
}
