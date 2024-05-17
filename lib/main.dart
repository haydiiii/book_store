import 'package:book_store/core/cache/cache_helper.dart';
import 'package:book_store/core/services/dio_helper/dio_helper.dart';
import 'package:book_store/features/manager/user_cubit.dart';
import 'package:book_store/splash_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  //DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return UserCubit(DioHelper(dio: Dio()));
      },
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplshView()),
    );
  }
}
