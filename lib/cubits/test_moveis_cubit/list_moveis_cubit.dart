import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/api/api_consumer.dart';
import 'package:movies_app/core/api/endpoint.dart';
import 'package:movies_app/core/errors/server_exeptions.dart';
import 'package:movies_app/cubits/test_moveis_cubit/list_moveis_state.dart';
import 'package:movies_app/models/movies_list_model.dart';

class TestMoveisCubit extends Cubit<TestMoveisState> {
  final ApiConsumer api;

  TestMoveisCubit(this.api) : super(TestMoveisInitial());

  Future<dynamic> getMoveis(String baseUrl) async {
    try {
      emit(TestMoveisLoading());
      Response response = await api.get(
        baseUrl,
        Endpoint.listMoveis,
      );
      print('===== Response Status: ${response.statusCode} =====');

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('===== Response Data: ${response.data} =====');

        if (response.data is String) {
          //var decodedData = jsonDecode(response.data);
          MoviesListModel moviesList = MoviesListModel.fromJson(jsonDecode(response.data));

          emit(TestMoveisSucsess(moveisList: moviesList.data!.movies!));
          return moviesList;
        } else if (response.data is Map<String, dynamic>) {
          MoviesListModel moviesList = MoviesListModel.fromJson(response.data);
          emit(TestMoveisSucsess(moveisList: moviesList.data!.movies!));
          return moviesList;
        } else {
          emit(TestMoveisFaliure(errorMessage: "Unexpected response format"));
          return null;
        }
      } else {
        emit(TestMoveisFaliure(
            errorMessage: response.statusMessage ?? "Unknown error"));
        print(
            '===== Error Response: ${response.statusMessage ?? "Unknown error"}');
      }
    } on ServerExeptions catch (e) {
      emit(TestMoveisFaliure(errorMessage: e.errorModel.message));
      print('===== Server Error: ${e.errorModel.message}');
    } catch (e) {
      emit(TestMoveisFaliure(errorMessage: e.toString()));
      print('===== General Error: ${e.toString()}');
    }
  }
}
