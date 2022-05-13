

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final String uId;

  LoginSuccessState(this.uId);
}
class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);
}
class GetDocValueSuccessState extends LoginStates{

}
class GetDocValueErrorState extends LoginStates{
  final String error;
  GetDocValueErrorState(this.error);
}
class LoginGetDoctorDataSuccessState extends LoginStates{

}
class LoginGetDoctorDataErrorState extends LoginStates{
  final String error;
  LoginGetDoctorDataErrorState(this.error);
}
class LoginChangePasswordVisibilityState extends LoginStates{}

