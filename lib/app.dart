import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_chat/repositories/authentication_repository.dart';
import 'package:q_chat/router/mainRouter.dart';
import 'features/authentication/bloc/authentication_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthenticationRepository _authenticationRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        lazy: false,
        create: (_) => AuthenticationBloc(
            authenticationRepository: _authenticationRepository),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return MainRouter(
              isNotAuthorized: state.credentials.isEmpty(),
            );
          },
        ),
      ),
    );
  }
}
