import 'package:book_store/core/services/dio_helper/end_points.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }));
  }

  Future<Response> getData({required String url, String? token}) async {
    dio!.options.headers = {
      "Authorization": "Bearer $token",
    };
    return await dio!.get(url);
  }

  Future<Response> postData({
    required String url,
    required dynamic data,
    String? token,
  }) async {
    dio!.options.headers["Authorization"] = "Bearer $token";
    return await dio!.post(url, data: data);
  }
}
