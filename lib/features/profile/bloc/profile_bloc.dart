import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_chat/features/profile/models/user.dart';
import 'package:q_chat/features/profile/repositories/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<UserProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;
  ProfileBloc({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository,
        super(const ProfileState()) {
    on<GetUserProfile>(_onGetUserProfile);
    // on<ProfilePasswordChanged>(_onPasswordChanged);
  }

  Future<void> _onGetUserProfile(
    GetUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    final user = await _profileRepository.getUserMe();
    emit(
      state.copyWith(
        user: user,
      ),
    );
  }
}
