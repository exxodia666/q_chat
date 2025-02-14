import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:q_chat/router/authRouter.dart';
import 'package:q_chat/router/homeRouter.dart';

class MainRouter extends StatelessWidget {
  final bool isNotAuthorized;

  const MainRouter({Key? key, required this.isNotAuthorized}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
