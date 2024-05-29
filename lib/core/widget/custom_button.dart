// ignore_for_file: must_be_immutable

import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.onPressed, required this.text});

  String? text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 285,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: AppColors.black),
          onPressed: onPressed,
          child: Text(
            'Login',
            style: getBodyStyle(fontsize: 18, color: AppColors.white),
          )),
    );
  }
}
