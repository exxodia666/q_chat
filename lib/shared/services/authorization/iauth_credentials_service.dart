import '../../models/models.dart';

abstract class IAuthorizationCredentialsService {
  Future<void> saveCredentialsToSecuredStorage(Credentials credentials);
  Future<Credentials?> retrieveCredentialsFromSecuredStorage();
  Future<void> resetCredentialsInSecuredStorage();
}
