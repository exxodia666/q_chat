part of 'edit_profile_bloc.dart';

final class EditProfileState extends Equatable {
  const EditProfileState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const Email.pure(),
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final Email email;
  final Username username;
  final Password password;
  final bool isValid;

  EditProfileState copyWith({
    FormzSubmissionStatus? status,
    Email? email,
    Username? username,
    Password? password,
    bool? isValid,
  }) {
    return EditProfileState(
      email: email ?? this.email,
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}
