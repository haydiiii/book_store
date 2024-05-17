import 'package:book_store/core/services/dio_helper/end_points.dart';

class ErrorModel {
  final int? status;
  final String? errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKeys.status],
      errorMessage: jsonData[ApiKeys.errorMessage],
    );
  }
}
