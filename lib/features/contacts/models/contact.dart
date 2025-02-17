import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact extends Equatable {
  Contact({required this.userName});

  final String userName;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [userName];
}
