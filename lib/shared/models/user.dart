import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String id;
  String? username;
  String email;

  User({required this.email, required this.id, this.username});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static var empty = User(email: '', id: '');

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
