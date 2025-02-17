part of 'user_bloc.dart';

final class UserState extends Equatable {
  const UserState({required this.user, required this.status});
  final RequestStatuses status;
  final User user;

  UserState copyWith({User? user, required status}) {
    return UserState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
