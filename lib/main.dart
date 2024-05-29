import 'package:book_store/core/cache/cache_helper.dart';
import 'package:book_store/core/services/dio_helper/dio_helper.dart';
import 'package:book_store/splash_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  String? token = CacheHelper.getDataString(key: 'token');
  print('token is $token');
  runApp(MainApp(token: token));
}

class MainApp extends StatelessWidget {
  final String? token;
  const MainApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplshView(token: token),
    );
  }
}
