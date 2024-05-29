import 'package:book_store/core/cache/cache_helper.dart';
import 'package:book_store/core/services/dio_helper/dio_helper.dart';
import 'package:book_store/core/services/dio_helper/end_points.dart';
import 'package:book_store/features/auth/login/manager/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(IntialLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  login() {
    emit(LoadingLoginState());
    DioHelper().postData(url: EndPoints.login, data: {
      "email": emailController.text,
      "password": passwordController.text
    }).then((value) {
      emit(SuccessLoginState());
     CacheHelper.saveData(key: 'token', value: value.data['data']['token']);
      print(value.data["data"]["token"]);
    }).catchError((error) {
      // print(error.toString());
      emit(ErrorLoginState());
    });
  }
}
