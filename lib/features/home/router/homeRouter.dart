import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:q_chat/features/home/view/home_page.dart';
import 'package:q_chat/core/constants/routes.dart';
import 'package:q_chat/shared/widgets/custom_header/header.dart';
import 'package:q_chat/shared/widgets/custom_scaffold/scaffold.dart';

final GlobalKey<NavigatorState> _homeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'home');
// For bottom bar
// final GoRouter _router = GoRouter(
//     navigatorKey: rootNavigatorKey,
//     initialLocation: Routes.home,
//     debugLogDiagnostics: true,
//     routes: <RouteBase>[
//       StatefulShellRoute.indexedStack(
//           builder: (context, state, navigationShell) {
//             void goBranch(int index) {
//               navigationShell.goBranch(
//                 index,
//                 initialLocation: index == navigationShell.currentIndex,
//               );
//             }

//             return CustomScaffold(
//               bottomAppBar: BottomBar(
//                 selectedIndex: navigationShell.currentIndex,
//                 setSelectedIndex: goBranch,
//               ),
//               child: navigationShell,
//             );
//           },
//           branches: [homeBranch, favoriteBranch, orderBranch, profileBranch])
//     ],
//   );

// final GoRouter homeRouter = GoRouter(
//     navigatorKey: _homeNavigatorKey,
//     initialLocation: Routes.home,
//     debugLogDiagnostics: true,
//     routes: <RouteBase>[
//       GoRoute(
//         path: Routes.home,
//         builder: (BuildContext context, GoRouterState state) {
//           return const HomePage();
//         },
//         routes: <RouteBase>[
//           GoRoute(
//             path: Routes.signUp,
//             builder: (BuildContext context, GoRouterState state) {
//               return const HomePage();
//             },
//           ),
//         ],
//       ),
//     ]);

final GlobalKey<NavigatorState> _homeShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'home_shell');

StatefulShellBranch homeBranch = StatefulShellBranch(
  navigatorKey: _homeShellNavigatorKey,
  routes: [
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) => NoTransitionPage(
        child: CustomScaffold(
          header: CustomHeader(
            title: 'Home',
            backBtn: false,
          ),
          child: const HomePage(),
        ),
      ),
      routes: [
        ShellRoute(
          navigatorKey: _homeShellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return CustomScaffold(header: CustomHeader(), child: child);
          },
          routes: <RouteBase>[
            GoRoute(
              path: Routes.home,
              builder: (BuildContext context, GoRouterState state) {
                return const HomePage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
