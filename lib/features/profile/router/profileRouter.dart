import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:q_chat/features/edit_profile/view/edit_profile_page.dart';
import 'package:q_chat/features/profile/bloc/profile_bloc.dart';
import 'package:q_chat/features/profile/repositories/profile_repository.dart';
import 'package:q_chat/features/profile/view/profile_page.dart';
import 'package:q_chat/core/constants/routes.dart';
import 'package:q_chat/shared/router/mainRouter.dart';
import 'package:q_chat/shared/widgets/custom_header/header.dart';
import 'package:q_chat/shared/widgets/custom_scaffold/scaffold.dart';

final GlobalKey<NavigatorState> _profileShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'profile_shell');

final GlobalKey<NavigatorState> _editProfileShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'edit_profile_shell');

StatefulShellBranch profileBranch = StatefulShellBranch(
  navigatorKey: _profileShellNavigatorKey,
  routes: [
    GoRoute(
      path: Routes.profile,
      pageBuilder: (context, state) => NoTransitionPage(
        child: BlocProvider(
          create: (context) => ProfileBloc(
              profileRepository: GetIt.instance<ProfileRepository>())
            ..add(const GetUserProfile()),
          child: CustomScaffold(
            header: CustomHeader(
              title: 'Profile',
              backBtn: false,
            ),
            child: const ProfilePage(),
          ),
        ),
      ),
      routes: [
        ShellRoute(
          parentNavigatorKey: rootNavigatorKey,
          navigatorKey: _editProfileShellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return CustomScaffold(
              header: CustomHeader(
                title: 'Edit Profile',
              ),
              bottomAppBar: Container(),
              child: child,
            );
          },
          routes: <RouteBase>[
            GoRoute(
              // parentNavigatorKey: _profileShellNavigatorKey,
              path: Routes.editProfile,
              builder: (BuildContext context, GoRouterState state) {
                return const EditProfilePage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
