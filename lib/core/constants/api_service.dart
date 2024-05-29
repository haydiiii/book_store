import 'package:dio/dio.dart';

String? token;

class ApiService {
  final _baseUrl = 'https://codingarabic.online/api';
  final Dio dio;

  ApiService({required this.dio});
  Future<Map<String, dynamic>> getData({required String endPoint}) async {
    var response = await dio.get(_baseUrl + endPoint);
    return response.data;
  }
}
