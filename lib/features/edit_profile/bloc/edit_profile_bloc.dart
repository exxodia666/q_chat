import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:q_chat/features/edit_profile/models/email.dart';
import 'package:q_chat/shared/repositories/user_repository.dart';

import '../models/models.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final UserRepository _userRepository;
  EditProfileBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const EditProfileState()) {
    on<EditProfileUsernameChanged>(_onUsernameChanged);
    on<EditProfilePasswordChanged>(_onPasswordChanged);
    on<EditProfileEmailChanged>(_onEmailChanged);
    on<SaveEditProfileSubmitted>(_editUserSubmitHandler);
  }

  void _onEmailChanged(
    EditProfileEmailChanged event,
    Emitter<EditProfileState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([state.email, email]),
      ),
    );
  }

  void _onUsernameChanged(
    EditProfileUsernameChanged event,
    Emitter<EditProfileState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([state.password, username]),
      ),
    );
  }

  void _onPasswordChanged(
    EditProfilePasswordChanged event,
    Emitter<EditProfileState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username]),
      ),
    );
  }

  Future<void> _editUserSubmitHandler(
    SaveEditProfileSubmitted event,
    Emitter<EditProfileState> emit,
  ) async {
    await _userRepository.editUserData(
        email: state.email.value,
        userName: state.username.value,
        password: state.password.value);
  }
}
