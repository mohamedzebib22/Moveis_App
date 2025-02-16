import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/api/api_consumer.dart';
import 'package:movies_app/core/api/endpoint.dart';
import 'package:movies_app/core/errors/server_exeptions.dart';
import 'package:movies_app/cubits/category_movies_cubit/category_movies_state.dart';
import 'package:movies_app/models/category_movies.dart';
import 'package:movies_app/models/movies_list_model.dart';




class CategoryMoviesCubit extends Cubit<CategoryMoviesState> {
  CategoryMoviesCubit(this.api) : super(CategoryMoviesInitial());
   final ApiConsumer api;

   //------------------------------------------
   int selectedIndex = 0;

 
  void changeSelectedIndex(int index) {
    selectedIndex = index;
     getMoveis(categoryId: CategoryMovies.categoryList[selectedIndex].categoryId);
    emit(CategoryMoviesIndexChanged(index: selectedIndex)); 
  }
    //----------------------------------------
    Future<dynamic> getMoveis({required String categoryId}) async {
    try {
      emit(CategoryMoviesLoading());
      Response response = await api.get(
        Endpoint.baseUrlMoveis,
        Endpoint.listMoveis,
      );
      print('===== Response Status: ${response.statusCode} =====');

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('===== Response Data: ${response.data} =====');

        if (response.data is String) {
          //var decodedData = jsonDecode(response.data);
          MoviesListModel moviesList =
              MoviesListModel.fromJson(jsonDecode(response.data));

          emit(CategoryMoviesSucsess(moveisList: moviesList.data!.movies!));
          return moviesList;
        } else if (response.data is Map<String, dynamic>) {
          MoviesListModel moviesList = MoviesListModel.fromJson(response.data);
          emit(CategoryMoviesSucsess(moveisList: moviesList.data!.movies!));
          return moviesList;
        } else {
          emit(CategoryMoviesFaliure(errorMessage: "Unexpected response format"));
          return null;
        }
      } else {
        emit(CategoryMoviesFaliure(
            errorMessage: response.statusMessage ?? "Unknown error"));
        print(
            '===== Error Response: ${response.statusMessage ?? "Unknown error"}');
      }
    } on ServerExeptions catch (e) {
      emit(CategoryMoviesFaliure(errorMessage: e.errorModel.message));
      print('===== Server Error: ${e.errorModel.message}');
    } catch (e) {
      emit(CategoryMoviesFaliure(errorMessage: e.toString()));
      print('===== General Error: ${e.toString()}');
    }
  }


}



