import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:q_chat/features/profile/view/profile_page.dart';
import 'package:q_chat/core/constants/routes.dart';
import 'package:q_chat/shared/router/header.dart';
import 'package:q_chat/shared/router/scaffold.dart';

final GlobalKey<NavigatorState> _profileShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'profile_shell');

StatefulShellBranch profileBranch = StatefulShellBranch(
  navigatorKey: _profileShellNavigatorKey,
  routes: [
    GoRoute(
      path: Routes.profile,
      pageBuilder: (context, state) => NoTransitionPage(
        child: CustomScaffold(
          header: CustomHeader(
            title: 'Profile',
            backBtn: false,
          ),
          child: const ProfilePage(),
        ),
      ),
      routes: [
        ShellRoute(
          navigatorKey: _profileShellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return CustomScaffold(header: CustomHeader(), child: child);
          },
          routes: <RouteBase>[
            GoRoute(
              path: Routes.profile,
              builder: (BuildContext context, GoRouterState state) {
                return const ProfilePage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
