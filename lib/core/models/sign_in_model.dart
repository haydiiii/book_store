import 'package:book_store/core/services/dio_helper/end_points.dart';

class SignInModel {
  final String message;
  final String token;

  SignInModel({required this.message, required this.token});
  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      message: json[ApiKeys.message],
      token: json[ApiKeys.token],
    );
  }
}
