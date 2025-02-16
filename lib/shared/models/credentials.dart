import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

Credentials _credentialsFromJson(Map<String, dynamic> json) {
  String accessToken = json['access_token'] as String;
  String refreshToken = json['refresh_token'] as String;
  return Credentials(
    accessToken: accessToken,
    refreshToken: refreshToken,
  );
}

Map<String, dynamic> _credentialsToJson(Credentials instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };

@JsonSerializable()
class Credentials extends Equatable {
  final String accessToken;
  final String? refreshToken;

  const Credentials({
    required this.accessToken,
    this.refreshToken,
  });

  static const empty = Credentials(accessToken: '');

  bool isEmpty() {
    return accessToken.isEmpty;
  }

  factory Credentials.fromJson(Map<String, dynamic> json) =>
      _credentialsFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _credentialsToJson(this);

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
      ];
}
