import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:q_chat/features/home/view/home_page.dart';
import 'package:q_chat/core/constants/routes.dart';

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

final GoRouter homeRouter = GoRouter(
    navigatorKey: _homeNavigatorKey,
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: Routes.signUp,
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
        ],
      ),
    ]);
