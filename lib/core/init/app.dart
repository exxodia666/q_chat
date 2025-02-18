import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:q_chat/features/authentication/authentication.dart';
import 'package:q_chat/shared/bloc/user_bloc.dart';
import 'package:q_chat/shared/repositories/auth_credentials_repository.dart';
import 'package:q_chat/shared/repositories/user_repository.dart';
import 'package:q_chat/shared/router/mainRouter.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthenticationRepository _authenticationRepository;
  late final AuthCredentialsRepository _authCredentialsRepository;
  late final UserRepository _userRepository;
  // init state
  @override
  void initState() {
    super.initState();
    _authenticationRepository = GetIt.I.get<AuthenticationRepository>();
    _authCredentialsRepository = GetIt.I.get<AuthCredentialsRepository>();
    _userRepository = GetIt.I.get<UserRepository>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (_) => AuthenticationBloc(
                authenticationRepository: _authenticationRepository,
                authCredentialsRepository: _authCredentialsRepository)
              ..add(InitWithCredentials()),
          ),
          BlocProvider(
            lazy: false,
            create: (_) =>
                UserBloc(userRepository: _userRepository)..add(GetUserMe()),
          )
        ],
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return MainRouter(
              isAuthorized: !state.credentials.isEmpty(),
            );
          },
        ));
  }
}
