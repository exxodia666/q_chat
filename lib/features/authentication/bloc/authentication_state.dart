part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.status = AuthenticationStatus.unknown,
    this.credentials = Credentials.empty,
  });

  final AuthenticationStatus status;
  final Credentials credentials;

  AuthenticationState copyWith({Credentials? credentials}) {
    return AuthenticationState(credentials: credentials ?? this.credentials);
  }

  @override
  List<Object> get props => [status, credentials];
}
