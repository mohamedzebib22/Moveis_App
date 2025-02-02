import 'package:bloc/bloc.dart';
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
      final response = api.post(Endpoint.signIn,
          data: {ApiKey.email: email, ApiKey.password: password});
      emit(LoginSucsess());
    } on ServerExeptions catch (e) {
      emit(LoginFaliur(errorMessage: e.errorModel.message));
    }
  }
}
