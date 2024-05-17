import 'package:book_store/core/services/dio_helper/api_consumer.dart';
import 'package:book_store/core/services/dio_helper/api_interceptors.dart';
import 'package:book_store/core/services/dio_helper/end_points.dart';
import 'package:book_store/core/services/errors/exceptions.dart';
import 'package:dio/dio.dart';

class DioHelper extends ApiConsumer {
  final Dio dio;

  DioHelper({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
        error: true,
        request: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        requestBody: true));
  }

  @override
  Future? get(String path, {Map<String, dynamic>? query, dynamic data ,  bool isFormData = false



  }) async {
    try {
      final response = await dio.get(path, queryParameters: query, data:isFormData?FormData.fromMap(data): data);
      return response.data;
    } on DioException catch (e) {
      handleErrorException(e);
    }
  }

  @override
  Future? post(String path, {Map<String, dynamic>? query, dynamic data,   bool isFormData = false
}) async {
    try {
      final response = await dio.get(path, queryParameters: query, data:isFormData?FormData.fromMap(data): data);
      return response.data;
    } on DioException catch (e) {
      handleErrorException(e);
    }
  }

  @override
  Future? delete(String path, {Map<String, dynamic>? query, dynamic data,  
  bool isFormData = false
  }) async {
    try {
      final response = await dio.get(path, queryParameters: query, data:isFormData?FormData.fromMap(data): data);
      return response.data;
    } on DioException catch (e) {
      handleErrorException(e);
    }
  }

  @override
  Future? patch(String path, {Map<String, dynamic>? query, dynamic data,
  bool isFormData = false}) async {
    try {
      final response = await dio.get(path, queryParameters: query, data:isFormData?FormData.fromMap(data): data);
      return response.data;
    } on DioException catch (e) {
      handleErrorException(e);
    }
  }

  // static Dio? dio;
  // static init() {
  //   dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
  // }

  // static Future<Response> getData(
  //     {required String url, Map<String, dynamic>? query, String? token}) async {
  //   dio!.options.headers = {
  //     "Accept": "application/json",
  //     "Content-Type": "application/json",
  //     "authorization": "Bearer$token"
  //   };
  //   return await dio!.get(url, queryParameters: query);
  // }

  // static Future<Response> postData(
  //     {required String url, Map<String, dynamic>? data}) async {
  //   dio!.options.headers = {
  //     "Accept": "application/json",
  //     "Content-Type": "application/json"
  //   };
  //   return await dio!.post(url, data: data);
}
