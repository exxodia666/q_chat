part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}


final class EditProfileEmailChanged extends EditProfileEvent {
  const EditProfileEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}
final class EditProfileUsernameChanged extends EditProfileEvent {
  const EditProfileUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}
final class EditProfilePasswordChanged extends EditProfileEvent {
  const EditProfilePasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}
final class SaveEditProfileSubmitted extends EditProfileEvent {
  const SaveEditProfileSubmitted();
}
