import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:q_chat/core/init/dependency_injection/service_locator.dart';

import 'core/init/app.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  await setupDependencies();
  runApp(const App());
}
