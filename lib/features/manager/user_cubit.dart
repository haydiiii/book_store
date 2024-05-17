import 'package:book_store/core/models/sign_in_model.dart';
import 'package:book_store/core/services/dio_helper/api_consumer.dart';
import 'package:book_store/core/services/dio_helper/end_points.dart';
import 'package:book_store/core/services/errors/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:book_store/core/cache/cache_helper.dart';


import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  SignInModel? user;

  UserCubit(this.api) : super(LoginIntialState());
  final ApiConsumer api;

  static UserCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  login(String email, String password) async {
    try {
      emit(LoginLoadingState());
      final response = await api.post(EndPoints.login, data: {
        ApiKeys.email:email  ,      ApiKeys.password: password
      });
      user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);

      CacheHelper().saveData(key: 'token', value: user!.token);
      CacheHelper().saveData(key: 'id', value: decodedToken[ApiKeys.id]);

      emit(LoginSuccessState());
    } on ServerException catch (e) {
      emit(LoginErrorState(errorMessage: e.errorModel.errorMessage));
    }
    // try {
    //   emit(LoginLoadingState());
    //   DioHelper.post(url: 'login', data: {
    //     'email': emailController.text,
    //     'password': passwordController.text
    //   });
    // } catch (e) {
    //   loging(e.toString());
    // }
  }
}
