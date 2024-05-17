import 'package:book_store/core/functions/routing.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/core/utils/text_style.dart';
import 'package:book_store/core/widget/custom_button.dart';
import 'package:book_store/features/auth/register/presentation/view/sign_up.dart';
import 'package:book_store/features/manager/user_cubit.dart';
import 'package:book_store/features/manager/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return SafeArea(
        child: BlocConsumer<UserCubit, UserState>(builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 162, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hello!',
                      style: getTitleStyle(
                          fontsize: 30,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'WELCOME BACK',
                      style:
                          getTitleStyle(fontsize: 30, color: AppColors.black),
                    ),
                  ],
                ),
                const Gap(35),
                TextFormField(
                  controller: emailController,
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
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    label: Text(
                      'Password',
                      style: getBodyStyle(
                          color: AppColors.greyColor, fontsize: 14),
                    ),
                  ),
                ),
                const Gap(35),
                 CustomButton(
                  onPressed: () {
                    context.read<UserCubit>().login(emailController.text, passwordController.text);
                  },
                  text: 'Login',
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password',
                      style: getBodyStyle(fontsize: 18),
                    )),
               
                TextButton(
                    onPressed: () {
                      pushto(context, const SignUpView());
                    },
                    child: Text(
                      'SignUp',
                      style: getBodyStyle(fontsize: 18),
                    )),
              ],
            ),
          ),
        ),
      );
    }, listener: (BuildContext context, UserState state) {
      if (state is LoginSuccessState) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("success"),
          ),
        );
      } else if (state is LoginErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errorMessage.toString()),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("failed"),
        ));
      }
    }));
  }
}
