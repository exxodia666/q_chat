import 'package:q_chat/shared/models/models.dart';

abstract class IAuthenticationService {
  Future<Credentials> signUpUsingEmailAndPassword(
      String email, String password);
  Future<Credentials> signInUsingEmailAndPassword(
      String email, String password);
  Future<Credentials> refreshToken(String refresh_token);
  Future<void> signOut();
}
