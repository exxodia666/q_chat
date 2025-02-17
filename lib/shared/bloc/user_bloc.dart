import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_chat/shared/models/request_statuses.dart';
import 'package:q_chat/shared/models/user.dart';
import 'package:q_chat/shared/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserState(user: User.empty, status: RequestStatuses.idle)) {
    on<GetUserMe>(_onGetUserMe);
    // on<UserPasswordChanged>(_onPasswordChanged);
  }

  Future<void> _onGetUserMe(
    GetUserMe event,
    Emitter<UserState> emit,
  ) async {
    emit(
      state.copyWith(status: RequestStatuses.loading),
    );
    final user = await _userRepository.getUserMe();
    emit(
      state.copyWith(user: user, status: RequestStatuses.success),
    );
  }
}
