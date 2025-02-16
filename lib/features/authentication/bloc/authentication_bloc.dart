import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:q_chat/features/authentication/authentication.dart';
import 'package:q_chat/shared/models/models.dart';
import 'package:q_chat/shared/repositories/auth_credentials_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository,
      required AuthCredentialsRepository authCredentialsRepository})
      : _authenticationRepository = authenticationRepository,
        _authCredentialsRepository = authCredentialsRepository,
        super(const AuthenticationState(credentials: Credentials.empty)) {
    // register events and handlers
    on<AuthenticationViaEmailAndPassword>(_onSignInSubmitted);
    on<SignUpViaEmailAndPassword>(_onSignUpSubmitted);
    on<InitWithCredentials>(_onInitWithCredentials);
    on<AuthenticationLogoutPressed>(_logoutHandler);
  }
  // repositories
  final AuthenticationRepository _authenticationRepository;
  final AuthCredentialsRepository _authCredentialsRepository;

  Future<void> _onSignInSubmitted(
    AuthenticationViaEmailAndPassword event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      Credentials credentials = await _authenticationRepository.logIn(
          email: event.email, password: event.password);
      if (!credentials.isEmpty()) {
        await _authCredentialsRepository.saveCredentials(
            credentials: credentials);
      }
      emit(state.copyWith(credentials: credentials));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onSignUpSubmitted(
    SignUpViaEmailAndPassword event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      Credentials credentials = await _authenticationRepository.signUp(
          email: event.email, password: event.password);
      emit(state.copyWith(credentials: credentials));
    } catch (_) {}
  }

  Future<void> _onInitWithCredentials(
    InitWithCredentials event,
    Emitter<AuthenticationState> emit,
  ) async {
    print('try to init');
    try {
      Credentials? credentials =
          await _authCredentialsRepository.getCredentials();
      if (credentials != null) {
        DateTime expirationDate =
            JwtDecoder.getExpirationDate(credentials.accessToken);
        Duration timeLeft = expirationDate.difference(DateTime.now());
        int minutesLeft = timeLeft.inMinutes;
        int secsLeft = timeLeft.inSeconds;
        print('Token expires in $minutesLeft minutes $secsLeft seconds');
      }
      emit(state.copyWith(credentials: credentials));
    } catch (e) {
      print('eror');
      print(e);
    }
  }

  Future<void> _logoutHandler(
    AuthenticationLogoutPressed event,
    Emitter<AuthenticationState> emit,
  ) async {
    print('try to logout');
    try {
      await _authenticationRepository.logOut();
      await _authCredentialsRepository.deleteCredentials();
      emit(state.copyWith(credentials: Credentials.empty));
    } catch (e) {
      print(e);
    }
  }
}
