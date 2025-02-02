
abstract class LoginState {}
 class LoginInitial extends LoginState {}
 class LoginLoading extends LoginState {}
 class LoginSucsess extends LoginState {}
 class LoginFaliur extends LoginState {
  String errorMessage ;
  LoginFaliur({required this.errorMessage});
 }

