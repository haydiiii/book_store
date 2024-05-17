class UserState {}

class LoginIntialState extends UserState {}

class LoginSuccessState extends UserState {}

class LoginErrorState extends UserState {
  final String ?errorMessage;

  LoginErrorState({required this.errorMessage});
}

class LoginLoadingState extends UserState {}
