class ProfileState {}

class ProfileInitial extends ProfileState {}
// image 
class LoadingImageState extends ProfileState {}

class SuccessImageState extends ProfileState {}

class ErrorImageState extends ProfileState {
  final String message;

  ErrorImageState(this.message);
}

///show profile

class LoadingProfileState extends ProfileState {}   
class SuccessProfileState extends ProfileState {}   
class FieldProfileState extends ProfileState {
  final String message;
  FieldProfileState(this.message);
}   



//update
class LoadingUpdateProfileState extends ProfileState {}

class SuccessUpdateProfileState extends ProfileState {}

class ErrorUpdateProfileState extends ProfileState {
  final String message;

  ErrorUpdateProfileState(this.message);
}
