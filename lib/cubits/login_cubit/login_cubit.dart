import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/api/api_consumer.dart';
import 'package:movies_app/core/api/endpoint.dart';
import 'package:movies_app/core/errors/server_exeptions.dart';
import 'package:movies_app/cubits/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginInitial());
  final ApiConsumer api;
  signIn(String email, String password) async {
    
    try {
      emit(LoginLoading());
      final Response response = await api.post(
        Endpoint.signIn,
        data: {ApiKey.email: email, ApiKey.password: password},
      );

      if (response.statusCode == 200) {
        emit(LoginSuccess());
        print(response.data.toString());
      } else {
        emit(LoginFailure(errorMessage: "Invalid email or password"));
      }
    } on ServerExeptions catch (e) {
      emit(LoginFailure(errorMessage: e.errorModel.message));
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}
