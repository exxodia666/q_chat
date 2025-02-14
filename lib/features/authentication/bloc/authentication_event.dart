part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

final class AuthenticationSubscriptionRequested extends AuthenticationEvent {}

final class AuthenticationLogoutPressed extends AuthenticationEvent {}

final class AuthenticationSaveCredentials extends AuthenticationEvent {
  const AuthenticationSaveCredentials(Credentials credentials);
}

final class AuthenticationViaEmailAndPassword extends AuthenticationEvent {
  final String password;
  final String email;

  const AuthenticationViaEmailAndPassword(
      {required this.email, required this.password});
}
