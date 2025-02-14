import 'package:go_router/go_router.dart';

class Routes {
  // Home stack
  static const home = '/home';
  // Profile stack
  static const profile = '/profile';
  // Auth stack
  static const signIn = '/signIn';
  static const signUp = 'signUp';
}

void navigateTo(context, route, {String id = ''}) {
  // GoRouter.of(context).go(
      // '${GoRouter.of(context).location}/$route${id.isNotEmpty ? '/$id' : ''}');
}

void switchTab(context, route) {
  GoRouter.of(context).go(route);
}

void goBack(context) {
  GoRouter.of(context).pop();
}