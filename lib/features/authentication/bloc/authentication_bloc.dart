import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_chat/models/credentials.dart';

import '../../../repositories/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState(credentials: Credentials.empty)) {
    on<AuthenticationViaEmailAndPassword>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onSubmitted(
    AuthenticationViaEmailAndPassword event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      Credentials credentials = await _authenticationRepository.logIn(
          email: event.email, password: event.password);
      emit(state.copyWith(credentials: credentials));
    } catch (_) {}
  }
}
