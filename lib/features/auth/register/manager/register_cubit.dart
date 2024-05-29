import 'package:book_store/features/auth/register/manager/register_state.dart';
import 'package:flutter/material.dart';
import 'package:book_store/core/services/dio_helper/dio_helper.dart';
import 'package:book_store/core/services/dio_helper/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(IntialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  void register() {
    emit(LoadingRegisterState());

    DioHelper().postData(
      url: EndPoints.register,
      data: {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "password_confirmation": confirmPasswordController.text,
      },
    ).then((value) {
      // final username = value.data["data"]["name"];
      emit(SuccessRegisterState());
      //  print('data is ${value.data["data"]}');
    }).catchError((error) {
      print("error is ${error.toString()}");
    });
  }
}
