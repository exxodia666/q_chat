import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:q_chat/core/constants/routes.dart';
import 'package:q_chat/features/contacts/view/contacts_page.dart';
import 'package:q_chat/features/profile/view/profile_page.dart';
import 'package:q_chat/shared/widgets/custom_header/header.dart';
import 'package:q_chat/shared/widgets/custom_scaffold/scaffold.dart';

final GlobalKey<NavigatorState> _contactsShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'contacts_shell');

StatefulShellBranch contactsBranch = StatefulShellBranch(
  navigatorKey: _contactsShellNavigatorKey,
  routes: [
    GoRoute(
      path: Routes.contacts,
      pageBuilder: (context, state) => NoTransitionPage(
        child: CustomScaffold(
          header: CustomHeader(
            title: 'Contacts',
            backBtn: false,
          ),
          child: const ContactsPage(),
        ),
      ),
      routes: [
        ShellRoute(
          navigatorKey: _contactsShellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return CustomScaffold(header: CustomHeader(), child: child);
          },
          routes: <RouteBase>[
            GoRoute(
              path: Routes.contacts,
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
