import 'dart:io';
import 'package:book_store/core/cache/cache_helper.dart';
import 'package:book_store/core/services/dio_helper/dio_helper.dart';
import 'package:book_store/core/services/dio_helper/end_points.dart';
import 'package:book_store/features/profile/manager/profile_state.dart';
import 'package:book_store/features/profile/model/user_data_model.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  Data? userModel;
  File? fileImage;

  Future<void> uploadImage() async {
    emit(LoadingImageState());
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      fileImage = File(result.files.single.path!);
      emit(SuccessImageState());
    } else {
      emit(ErrorImageState('No file selected'));
    }
  }

  Future<void> getUserData() async {
    emit(LoadingProfileState());
    try {
      final response = await DioHelper().getData(
        url: EndPoints.profile,
        token: CacheHelper.getDataString(key: 'token'),
      );
      if (response.statusCode == 200) {
        userModel = Data.fromJson(response.data['data']);
        emit(SuccessProfileState());
      } else {
        emit(FieldProfileState('Failed to get user data'));
      }
    } catch (error) {
      print('error is $error');
      emit(FieldProfileState(error.toString()));
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String city,
    required String address,
  }) async {
    emit(LoadingUpdateProfileState());
    try {
      Map<String, dynamic> data = {
        'name': name,
        'email': email,
        'phone': phone,
        'city': city,
        'address': address,
      };

      if (fileImage != null) {
        data['image'] = await MultipartFile.fromFile(fileImage!.path);
      }

      FormData formData = FormData.fromMap(data);

      final response = await DioHelper().postData(
        url: EndPoints.updateProfile,
        data: formData,
      );

      if (response.statusCode == 200) {
        emit(SuccessUpdateProfileState());
      } else {
        emit(ErrorUpdateProfileState('Failed to update profile'));
      }
    } catch (error) {
      emit(ErrorUpdateProfileState(error.toString()));
    }
  }
}
