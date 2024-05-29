import 'package:book_store/core/functions/routing.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/core/utils/text_style.dart';
import 'package:book_store/core/widget/custom_button.dart';
import 'package:book_store/features/auth/register/presentation/view/sign_up.dart';
import 'package:book_store/features/home/presentation/view/home_view.dart';
import 'package:book_store/features/home/presentation/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../manager/login_cubit.dart';
import '../../manager/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return LoginCubit();
      },
      child: SafeArea(
          child: Scaffold(
              body: BlocConsumer<LoginCubit, LoginState>(
        listener: (BuildContext context, Object? state) {
          if (state is SuccessLoginState) {
            pushWithReplacement(context, const NavBarWidget());
          }
          if (state is ErrorLoginState) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  content: Wrap(
                    children: [
                      Column(
                        children: [
                          Text('Email or Password is wrong'),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
        builder: (BuildContext context, LoginState state) {
          var cubit = LoginCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 162, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Hello!',
                          style: getTitleStyle(
                              fontsize: 30,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold)),
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
                    controller: cubit.emailController,
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
                    controller: cubit.passwordController,
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
                  state is LoadingLoginState
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          onPressed: () {
                            cubit.login();
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
          );
        },
      ))),
    );
  }
}
