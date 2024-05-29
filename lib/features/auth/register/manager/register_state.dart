class RegisterState {}

class IntialRegisterState extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class SuccessRegisterState extends RegisterState {}

class ErrorRegisterState extends RegisterState {
  final String error;

  ErrorRegisterState(String s, {required this.error});
}
