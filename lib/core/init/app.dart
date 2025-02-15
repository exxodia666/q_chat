import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:q_chat/features/authentication/authentication.dart';
import 'package:q_chat/shared/repositories/auth_credentials_repository.dart';
import 'package:q_chat/shared/router/mainRouter.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthenticationRepository _authenticationRepository;
  late final AuthCredentialsRepository _authCredentialsRepository;
  // init state
  @override
  void initState() {
    super.initState();
    _authenticationRepository = GetIt.I.get<AuthenticationRepository>();
    _authCredentialsRepository = GetIt.I.get<AuthCredentialsRepository>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => AuthenticationBloc(
          authenticationRepository: _authenticationRepository,
          authCredentialsRepository:
              _authCredentialsRepository)
        ..add(InitWithCredentials()),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return MainRouter(
            isNotAuthorized: state.credentials.isEmpty(),
          );
        },
      ),
    );
  }
}
