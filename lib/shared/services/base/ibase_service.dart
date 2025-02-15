import 'package:http/http.dart';

abstract class IBaseService {
  Future<Response> postData({required dynamic body, required String url});
  Future<Response> getData({required String url});
  Future<Response> deleteData({required String url});
}
