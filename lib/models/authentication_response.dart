
import 'package:q_chat/models/models.dart';

class AuthenticationResponse {
  final Credentials credentials;
  const AuthenticationResponse({required this.credentials});

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) {
    return AuthenticationResponse(
        credentials: Credentials(
            accessToken: json['accessToken'],
            accessTokenExpiresAt: json['accessTokenExpiresAt'],
            refreshToken: json['refreshToken'],
            refreshTokenExpiresAt: json['refreshTokenExpiresAt']));
  }
  @override
  String toString() {
    return 'accessToken: ${credentials.accessToken}, refresh: ${credentials.refreshToken}';
  }
}
