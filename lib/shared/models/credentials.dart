import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'credentials.g.dart';

Credentials _credentialsFromJson(Map<String, dynamic> json) {
  String access_token = json['access_token'] as String;
  String refresh_token = json['refresh_token'] as String;
  Map<String, dynamic> decodedAccess = JwtDecoder.decode(access_token);
  Map<String, dynamic> decodedRefresh = JwtDecoder.decode(access_token);
  DateTime access_token_expires_at =
      DateTime.fromMillisecondsSinceEpoch(decodedAccess['exp'] * 1000);
  DateTime refresh_token_expires_at =
      DateTime.fromMillisecondsSinceEpoch(decodedRefresh['exp'] * 1000);
  return Credentials(
    access_token: access_token,
    access_token_expires_at: access_token_expires_at,
    refresh_token: refresh_token,
    refresh_token_expires_at: refresh_token_expires_at,
  );
}

Map<String, dynamic> _credentialsToJson(Credentials instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'access_token_expires_at': instance.access_token_expires_at?.millisecondsSinceEpoch,
      'refresh_token': instance.refresh_token,
      'refresh_token_expires_at': instance.refresh_token_expires_at?.millisecondsSinceEpoch,
    };

@JsonSerializable()
class Credentials extends Equatable {
  final String access_token;
  final DateTime? access_token_expires_at;
  final String? refresh_token;
  final DateTime? refresh_token_expires_at;

  const Credentials(
      {required this.access_token,
      this.access_token_expires_at,
      this.refresh_token,
      this.refresh_token_expires_at});

  static const empty = Credentials(access_token: '');

  bool isEmpty() {
    return access_token.isEmpty;
  }

  factory Credentials.fromJson(Map<String, dynamic> json) =>
      _credentialsFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _credentialsToJson(this);

  @override
  List<Object?> get props => [
        access_token,
        access_token_expires_at,
        refresh_token,
        refresh_token_expires_at
      ];
}
