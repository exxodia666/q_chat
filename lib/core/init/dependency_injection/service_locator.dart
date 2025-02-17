import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:q_chat/features/authentication/authentication.dart';
import 'package:q_chat/features/contacts/repositories/contacts_repository.dart';
import 'package:q_chat/features/contacts/services/contacts_service.dart';
import 'package:q_chat/shared/repositories/auth_credentials_repository.dart';
import 'package:q_chat/shared/repositories/user_repository.dart';
import 'package:q_chat/shared/services/services.dart';
import 'package:q_chat/shared/services/user/user_service.dart';

Future<void> setupDependencies() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  // init auth credentials Service
  final authCredService = AuthorizationCredentialsService(storage: storage);
  // get credentials from secure storage to use it inside  base Service`s headers
  // Credentials? credentials = await authCredentialsRepository.getCredentials();
  // setup base Service and pass credentials
  final baseService = BaseService();
  final authenticationService = AuthenticationService(baseService: baseService);
  final userService = UserService(baseService: baseService);
  final contactsService = ContactsService(baseService: baseService);
  // register Service singletons
  GetIt.I.registerSingleton<BaseService>(baseService);
  GetIt.I.registerSingleton<AuthenticationService>(authenticationService);
  GetIt.I.registerSingleton<AuthorizationCredentialsService>(authCredService);
  GetIt.I.registerSingleton<ContactsService>(contactsService);
  // setup repositories
  // init auth credentials repository
  final authCredentialsRepository =
      AuthCredentialsRepository(authCredService: authCredService);
  GetIt.I.registerSingleton<AuthenticationRepository>(
      AuthenticationRepository(baseService: baseService));

  GetIt.I.registerSingleton<UserRepository>(
      UserRepository(userService: userService, baseService: baseService));
  GetIt.I.registerSingleton<ContactsRepository>(
      ContactsRepository(contactsService: contactsService));
  GetIt.I
      .registerSingleton<AuthCredentialsRepository>(authCredentialsRepository);
}
