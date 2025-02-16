part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class ProfileUsernameChanged extends ProfileEvent {
  const ProfileUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class ProfilePasswordChanged extends ProfileEvent {
  const ProfilePasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class SaveProfileSubmitted extends ProfileEvent {
  const SaveProfileSubmitted();
}
