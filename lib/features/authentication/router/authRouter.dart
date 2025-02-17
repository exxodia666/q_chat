import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:q_chat/features/authentication/view/pages/login_page.dart';
import 'package:q_chat/core/constants/routes.dart';
import 'package:q_chat/features/authentication/view/pages/sign_up_page.dart';

final GlobalKey<NavigatorState> _authNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'auth');

final GoRouter authRouter = GoRouter(
    navigatorKey: _authNavigatorKey,
    initialLocation: Routes.signIn,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.signIn,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: Routes.signUp,
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpPage();
            },
          ),
        ],
      ),
    ]);
