import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/api/api_consumer.dart';
import 'package:movies_app/core/api/endpoint.dart';
import 'package:movies_app/core/errors/server_exeptions.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.api) : super(RegisterInitial());
  final ApiConsumer api;
  var formkey = GlobalKey<FormState>();
  
  var avatarNumber =2;
  String? validateField(String? title, String errorMessage) {
    if (title == null || title.isEmpty) {
      return errorMessage;
    }
    return null;
  }

  signUp(
      {required baseUrl,
      required int avaterId,
      required String name,
      required String email,
      required String password,
      required String confirmPassword,
      required String phone}) async {
    if (formkey.currentState?.validate() == true) {
      try {
        emit(RegisterLoading());
        final Response response =
            await api.post(baseUrl, Endpoint.signUp, data: {
          ApiKey.name: name, 
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.confirmPassword: confirmPassword,
          ApiKey.phone: phone,
          'avaterId': avaterId
        });
        if (response.statusCode == 200 || response.statusCode == 201) {
          print('=====The Signup Is Sucsess');
          emit(RegisterSuccess());
          print('==== the data is ${response.data}');
        } else {
          print('===== Error Response: ${response.data}');
          emit(RegisterFailure(errorMessage: "someThing went Wrong"));
        }
      } on ServerExeptions catch (e) {
        emit(RegisterFailure(errorMessage: e.errorModel.message));
      } catch (e) {
        emit(RegisterFailure(errorMessage: e.toString()));
      }
    }
  }
  
  void updateAvatar(int newAvatar){
    avatarNumber =newAvatar;
    emit(RegisterChangeAvatar());
  }
}
