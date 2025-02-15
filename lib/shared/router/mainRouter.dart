import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:q_chat/features/authentication/router/authRouter.dart';
import 'package:q_chat/features/home/router/homeRouter.dart';

class MainRouter extends StatelessWidget {
  final bool isNotAuthorized;

  const MainRouter({Key? key, required this.isNotAuthorized}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(isNotAuthorized);
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
      routerConfig: isNotAuthorized ? authRouter : homeRouter,
      // routes: {
      //   '/': (context) => SignIn(),
      //   '/signUp': (context) => SignUp(),
      //   '/home': (context) => Home(),
      // },
      // home: const SignIn(),
    );
  }
}

void navigateTo(context, route, {String id = ''}) {
  print(GoRouterState.of(context).path);
  GoRouter.of(context).go(
      '${GoRouterState.of(context).path}/$route${id.isNotEmpty ? '/$id' : ''}');
}

void switchTab(context, route) {
  GoRouter.of(context).go(route);
}

void goBack(context) {
  GoRouter.of(context).pop();
}
