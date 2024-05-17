import 'package:book_store/core/functions/routing.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/core/utils/text_style.dart';
import 'package:book_store/core/widget/custom_button.dart';
import 'package:book_store/features/auth/login/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 145, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'WELCOME ',
                      style:
                          getTitleStyle(fontsize: 30, color: AppColors.black),
                    ),
                  ],
                ),
                const Gap(35),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      'Name',
                      style: getBodyStyle(
                          color: AppColors.greyColor, fontsize: 14),
                    ),
                  ),
                ),
                const Gap(35),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      'Email',
                      style: getBodyStyle(
                          color: AppColors.greyColor, fontsize: 14),
                    ),
                  ),
                ),
                const Gap(35),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    label: Text(
                      'Password',
                      style: getBodyStyle(
                          color: AppColors.greyColor, fontsize: 14),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    label: Text(
                      'Confirm Password',
                      style: getBodyStyle(
                          color: AppColors.greyColor, fontsize: 14),
                    ),
                  ),
                ),
                const Gap(35),
                CustomButton(
                  onPressed: () {},
                  text: 'SignUp',
                ),
                const Gap(35),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password',
                      style: getBodyStyle(fontsize: 18),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                    ),
                    TextButton(
                        onPressed: () {
                          pushto(context, const LoginView());
                        },
                        child: Text(
                          'SignIn',
                          style: getBodyStyle(fontsize: 18),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
