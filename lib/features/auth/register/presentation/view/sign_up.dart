import 'package:book_store/core/functions/routing.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/core/utils/text_style.dart';
import 'package:book_store/core/widget/custom_button.dart';
import 'package:book_store/features/auth/login/presentation/view/login_view.dart';
import 'package:book_store/features/auth/register/manager/register_cubit.dart';
import 'package:book_store/features/auth/register/manager/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (BuildContext context) {
          return RegisterCubit();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (BuildContext context, RegisterState state) {
                if (state is SuccessRegisterState) {
                  pushto(context, const LoginView());
                } else if (state is ErrorRegisterState) {
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
              builder: (BuildContext context, RegisterState state) {
                var cubit = RegisterCubit.get(context);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 145, horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'WELCOME ',
                            style: getTitleStyle(
                                fontsize: 30, color: AppColors.black),
                          ),
                        ],
                      ),
                      const Gap(35),
                      TextFormField(
                        controller: cubit.nameController,
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
                      TextFormField(
                        controller: cubit.confirmPasswordController,
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
                      state is LoadingRegisterState
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              onPressed: () {
                                cubit.register();
                              },
                              text: 'Sign Up',
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
                                'Sign In',
                                style: getBodyStyle(fontsize: 18),
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
