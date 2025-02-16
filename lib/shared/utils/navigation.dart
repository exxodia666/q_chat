import 'package:go_router/go_router.dart';

void navigateTo(context, route, {String id = ''}) {
  print('path: ${GoRouterState.of(context).path}');
  GoRouter.of(context).go(
      '${GoRouterState.of(context).path}/$route${id.isNotEmpty ? '/$id' : ''}');
}

void switchTab(context, route) {
  GoRouter.of(context).go(route);
}

void goBack(context) {
  GoRouter.of(context).pop();
}