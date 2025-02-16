import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:q_chat/shared/models/models.dart';
import 'package:q_chat/shared/services/services.dart';

class BaseService {
  final String? baseUrl = dotenv.env['BASE_API_URL'];
  final AuthorizationCredentialsService _authorizationCredentialsService;
  BaseService()
      : _authorizationCredentialsService = AuthorizationCredentialsService();

  Future<Credentials> _refreshAccessToken(String refreshToken) async {
    var requestUrl = Uri.https(baseUrl!, '/api/v1/refresh');
    var response = await http.post(
      requestUrl,
      body: json.encode({"refresh_token": refreshToken}),
    );

    return Credentials.fromJson(jsonDecode(response.body));
  }

  Future<Credentials?> _ensureValidAccessToken(
      // ignore: non_constant_identifier_names
      String? accessToken,
      // ignore: non_constant_identifier_names
      String? refreshToken) async {
    print('isExpired: ${JwtDecoder.isExpired(accessToken ?? '')}');
    if (accessToken == null || JwtDecoder.isExpired(accessToken)) {
      try {
        final result = await _refreshAccessToken(refreshToken!);
        print('GOT NEW ONE: ${result.accessToken}');
        _authorizationCredentialsService
            .saveCredentialsToSecuredStorage(result);
        return result;
      } catch (_) {
        print('Error updating token');
        _authorizationCredentialsService.resetCredentialsInSecuredStorage();
      }
    }
    return null;
  }

  postData({
    required String url,
    required dynamic body,
  }) async {
    late Credentials? credentials;
    // Retrieve Credentials;
    credentials = await _authorizationCredentialsService
        .retrieveCredentialsFromSecuredStorage();
    print('FETCH DATA WITH TOKEN: ${credentials?.accessToken ?? ''}');
    // if access token is outdated
    if (credentials?.refreshToken != null) {
      var newCredentials = await _ensureValidAccessToken(
          credentials?.accessToken, credentials?.refreshToken);
      credentials = newCredentials ?? credentials;
    }
    var requestUrl = Uri.https(baseUrl!, url);
    Map<String, String> headers = {};
    if (credentials?.accessToken != null) {
      print('New one used: ${credentials?.accessToken ?? ''}');
      headers['Authorization'] = 'Bearer ${credentials?.accessToken ?? ''}';
    }
    var response =
        await http.post(requestUrl, body: json.encode(body), headers: headers);
    return response;
  }

  deleteData({required String url}) async {
    late Credentials? credentials;
    // Retrieve Credentials;
    credentials = await _authorizationCredentialsService
        .retrieveCredentialsFromSecuredStorage();
    print('FETCH DATA WITH TOKEN: ${credentials?.accessToken ?? ''}');
    // if access token is outdated
    if (credentials?.refreshToken != null) {
      var newCredentials = await _ensureValidAccessToken(
          credentials?.accessToken, credentials?.refreshToken);
      credentials = newCredentials ?? credentials;
    }
    var requestUrl = Uri.https(baseUrl!, url);
    var response = await http.delete(requestUrl,
        headers: {'Authorization': 'Bearer ${credentials?.accessToken ?? ''}'});
    return response;
  }

  getData({required String url, Credentials? credentials}) async {
    late Credentials? credentials;
    // Retrieve Credentials;
    credentials = await _authorizationCredentialsService
        .retrieveCredentialsFromSecuredStorage();
    print('FETCH DATA WITH TOKEN: ${credentials?.accessToken ?? ''}');
    // if access token is outdated
    if (credentials?.refreshToken != null) {
      var newCredentials = await _ensureValidAccessToken(
          credentials?.accessToken, credentials?.refreshToken);
      credentials = newCredentials ?? credentials;
    }
    var requestUrl = Uri.https(baseUrl!, url);
    var response = await http.get(
      requestUrl,
      headers: {'Authorization': 'Bearer ${credentials?.accessToken ?? ''}'},
    );
    return response;
  }
}
