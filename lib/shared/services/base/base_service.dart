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
      String? access_token,
      // ignore: non_constant_identifier_names
      String? refresh_token) async {
    print('isExpired: ${JwtDecoder.isExpired(access_token ?? '')}');
    if (access_token == null || JwtDecoder.isExpired(access_token)) {
      try {
        final result = await _refreshAccessToken(refresh_token!);
        print('GOT NEW ONE: ${result.access_token}');
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
    print('FETCH DATA WITH TOKEN: ${credentials?.access_token ?? ''}');
    // if access token is outdated
    if (credentials?.refresh_token != null) {
      credentials = await _ensureValidAccessToken(
          credentials?.access_token, credentials?.refresh_token);
    }
    var requestUrl = Uri.https(baseUrl!, url);
    Map<String, String> headers = {};
    if (credentials?.access_token != null) {
      print('New one used: ${credentials?.access_token ?? ''}');
      headers['Authorization'] = 'Bearer ${credentials?.access_token ?? ''}';
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
    print('FETCH DATA WITH TOKEN: ${credentials?.access_token ?? ''}');
    // if access token is outdated
    if (credentials?.refresh_token != null) {
      credentials = await _ensureValidAccessToken(
          credentials?.access_token, credentials?.refresh_token);
    }
    var requestUrl = Uri.https(baseUrl!, url);
    var response = await http.delete(requestUrl, headers: {
      'Authorization': 'Bearer ${credentials?.access_token ?? ''}'
    });
    return response;
  }

  getData({required String url, Credentials? credentials}) async {
    late Credentials? credentials;
    // Retrieve Credentials;
    credentials = await _authorizationCredentialsService
        .retrieveCredentialsFromSecuredStorage();
    print('FETCH DATA WITH TOKEN: ${credentials?.access_token ?? ''}');
    // if access token is outdated
    if (credentials?.refresh_token != null) {
      credentials = await _ensureValidAccessToken(
          credentials?.access_token, credentials?.refresh_token);
    }
    var requestUrl = Uri.https(baseUrl!, url);
    var response = await http.get(
      requestUrl,
      headers: {'Authorization': 'Bearer ${credentials?.access_token ?? ''}'},
    );
    return response;
  }
}
