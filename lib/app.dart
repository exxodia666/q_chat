import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_chat/repositories/authentication_repository.dart';
import 'package:q_chat/router/authRouter.dart';
import 'package:q_chat/router/homeRouter.dart';
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
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'QChat',
              // localizationsDelegates: const [
              //   AppLocalizations.delegate, // Add this line
              //   GlobalMaterialLocalizations.delegate,
              //   GlobalWidgetsLocalizations.delegate,
              //   GlobalCupertinoLocalizations.delegate,
              // ],
              // supportedLocales: const [
              //   Locale('en'), // English
              //   Locale('uk'), // Ukrainian
              // ],
              theme: ThemeData(),
              routerConfig: state.credentials.isEmpty() ? authRouter : homeRouter,
              // routes: {
              //   '/': (context) => SignIn(),
              //   '/signUp': (context) => SignUp(),
              //   '/home': (context) => Home(),
              // },
              // home: const SignIn(),
            );
          },
        ),
      ),
    );
  }
}
