import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:movies_app/Features/defualt_page/presentation/views/bottom_navigation_bar.dart';
import 'package:movies_app/core/api/api_consumer.dart';
import 'package:movies_app/core/api/endpoint.dart';
import 'package:movies_app/core/errors/server_exeptions.dart';
import 'package:movies_app/core/helper/cach_helper.dart';
import 'package:movies_app/Features/login_page/data/cubit/login_cubit/login_state.dart';
import 'package:movies_app/core/utils/models/sign_in_model.dart';
import 'package:movies_app/Features/forget_password_page/presentation/views/forget_password_page.dart';
import 'package:movies_app/Features/register_page/presentation/views/register_page.dart';
import 'package:movies_app/Features/list_movies_tap_page/presentation/views/list_moveis_ui.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginInitial());
  final ApiConsumer api;
  var formkey = GlobalKey<FormState>();

  signIn(String email, String password, String baseUrl, context) async {
    SignInModel? user;
    if (formkey.currentState?.validate() == true) {
      try {
        emit(LoginLoading());
        final Response response = await api.post(
          baseUrl,
          Endpoint.signIn,
          data: {ApiKey.email: email, ApiKey.password: password},
        );
        
        if (response.statusCode == 200) {
          user = SignInModel.fromJson(response.data);
          
          final decodedToken = JwtDecoder.decode(user.token);
          CachHelper().saveData(key:ApiKey.token,value: user.token );
          CachHelper().saveData(key:ApiKey.id,value: decodedToken[ApiKey.id] );
          print('The id is ${decodedToken['id']}===============');
          emit(LoginSuccess());
          Navigator.pushReplacementNamed(context, DefualtPage.id);
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

  void NavigateToRegisterPage(context) {
    Navigator.pushReplacementNamed(context, RegisterPage.id);
  }

  void NavigateToForgetPasswordPage(context) {
    Navigator.pushNamed(context, ForgetPasswordPage.id);
  }

  String? validateField(String? title, String errorMessage) {
    if (title == null || title.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
