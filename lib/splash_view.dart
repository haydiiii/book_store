import 'package:book_store/core/constants/iamge_assets.dart';
import 'package:book_store/core/functions/routing.dart';
import 'package:book_store/core/utils/text_style.dart';
import 'package:book_store/features/auth/login/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplshView extends StatefulWidget {
  const SplshView({super.key});

  @override
  State<SplshView> createState() => _SplshViewState();
}

class _SplshViewState extends State<SplshView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      pushWithReplacement(context, const LoginView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(ImagesAssets.image1),
        Text(
          'Welcome to Book Store',
          style: getTitleStyle(),
        )
      ],
    )));
  }
}
