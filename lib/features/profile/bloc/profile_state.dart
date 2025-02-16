part of 'profile_bloc.dart';

final class ProfileState extends Equatable {
  const ProfileState({this.user});

  final User? user;

  ProfileState copyWith({
    User? user,
  }) {
    return ProfileState(
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [];
}
