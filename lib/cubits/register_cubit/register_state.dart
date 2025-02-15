part of 'register_cubit.dart';


abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterChangeAvatar extends RegisterState {}
class RegisterTest extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {}
class RegisterFailure extends RegisterState {
  String errorMessage ;
  RegisterFailure({required this.errorMessage});
}
