import 'package:equatable/equatable.dart';

class Credentials extends Equatable {
  final String accessToken;
  final String? accessTokenExpiresAt;
  final String? refreshToken;
  final String? refreshTokenExpiresAt;

  const Credentials(
      {required this.accessToken,
      this.accessTokenExpiresAt,
      this.refreshToken,
      this.refreshTokenExpiresAt});

  static const empty = Credentials(accessToken: '');

  bool isEmpty() {
    return accessToken.isEmpty;
  }

  @override
  List<Object?> get props =>
      [accessToken, accessTokenExpiresAt, refreshToken, refreshTokenExpiresAt];
}
