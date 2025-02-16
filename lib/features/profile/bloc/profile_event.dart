part of 'profile_bloc.dart';

sealed class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

final class GetUserProfile extends UserProfileEvent {
  const GetUserProfile();
}
