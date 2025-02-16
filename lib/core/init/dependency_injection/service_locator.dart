import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:q_chat/features/authentication/authentication.dart';
import 'package:q_chat/shared/repositories/auth_credentials_repository.dart';
import 'package:q_chat/shared/services/services.dart';

Future<void> setupDependencies() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
// init auth credentials Service
  final authCredService = AuthorizationCredentialsService(storage: storage);
// init auth credentials repository
  final authCredentialsRepository =
      AuthCredentialsRepository(authCredService: authCredService);
// get credentials from secure storage to use it inside  base Service`s headers
  // Credentials? credentials = await authCredentialsRepository.getCredentials();
  // setup base Service and pass credentials
  final baseService = BaseService();
  final authenticationService = AuthenticationService(baseService: baseService);

  GetIt.I.registerSingleton<BaseService>(baseService);
  GetIt.I.registerSingleton<AuthenticationService>(authenticationService);
  GetIt.I.registerSingleton<AuthorizationCredentialsService>(authCredService);
  // setup repositories
  GetIt.I.registerSingleton<AuthenticationRepository>(
      AuthenticationRepository(baseService: baseService));

  GetIt.I
      .registerSingleton<AuthCredentialsRepository>(authCredentialsRepository);
}
