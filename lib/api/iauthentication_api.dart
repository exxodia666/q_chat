import 'package:q_chat/models/models.dart';

abstract class IAuthenticationApi {
  Future<AuthenticationResponse> signUpUsingEmailAndPassword(
      String email, String password);
  Future<AuthenticationResponse> signInUsingEmailAndPassword(
      String email, String password);
  Future<AuthenticationResponse> refreshToken(String refreshToken);
  Future<void> signOut(String refreshToken);
}
