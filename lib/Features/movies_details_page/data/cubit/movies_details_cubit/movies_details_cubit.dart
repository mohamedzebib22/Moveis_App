import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/api/api_consumer.dart';
import 'package:movies_app/core/api/endpoint.dart';
import 'package:movies_app/core/errors/server_exeptions.dart';
import 'package:movies_app/Features/movies_details_page/data/cubit/movies_details_cubit/movies_details_state.dart';
import 'package:movies_app/Features/movies_details_page/data/cubit/movies_details_cubit/movies_details_state.dart';

import 'package:movies_app/Features/movies_details_page/data/models/movies_details.dart';
import 'package:movies_app/core/utils/models/movies_list_model.dart';
import 'package:movies_app/Features/movies_details_page/data/models/movies_suggestion.dart';
import 'package:movies_app/Features/movies_details_page/presentation/views/movies_details_page.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  MoviesDetailsCubit(this.api) : super(MoviesDetailsInitial());
  final ApiConsumer api;
 
  Future<dynamic> getMoveisDetails({required int id}) async {
    try {
      emit(MoviesDetailsLoading());
      final Response response = await api.get(
          Endpoint.baseUrlMoveis, Endpoint.moveisDetails,
          queryParameters: {
            'movie_id': id,
          });
      if (response.statusCode! >= 200 || response.statusCode! <= 300) {
        if (response.data is String) {
          MovisDetails moviesDetails =
              MovisDetails.fromJson(jsonDecode(response.data));
              print('********Movie details: ${moviesDetails.data!.movie!.genres}/*/*/*/*/*/');
          emit(MoviesDetailSucsess(detailsMovie: moviesDetails.data!.movie));

          return moviesDetails;
        } else if (response.data is Map<String, dynamic>) {
          MovisDetails moviesDetails = MovisDetails.fromJson(response.data);
          print('********Movie details: ${moviesDetails.data!.movie!.genres}/*/*/*/*/*/');
          emit(MoviesDetailSucsess(detailsMovie: moviesDetails.data!.movie));

          return moviesDetails;
        } else {
          emit(MoviesDetailFaliure(
              errorMessage: response.statusMessage ?? 'UnKownError'));
        }
      } else {
        emit(MoviesDetailFaliure(
            errorMessage: response.statusMessage ?? 'UnKownError'));

        print(
            '===== Error Response: ${response.statusMessage ?? "Unknown error"}');
      }
    } on ServerExeptions catch (e) {
      emit(MoviesDetailFaliure(errorMessage: e.errorModel.message));
      print('===== Server Error: ${e.errorModel.message}');
    } catch (e) {
      emit(MoviesDetailFaliure(errorMessage: e.toString()));

      print('=*==*=*= General Error: ${e.toString()}');
    }
  }

  Future<dynamic> getMoviesSuggesion({required int id}) async {
    try {
      final Response response = await api.get(
          Endpoint.baseUrlMoveis, Endpoint.moviesSuggetion,
          queryParameters: {'movie_id': id});
      if (response.statusCode! >= 200 || response.statusCode! <= 300) {
        if (response.data is String) {
          MoviesSuggestion moviesSuggestion =
              MoviesSuggestion.fromJson(jsonDecode(response.data));
          emit(MoviesDetailSucsess(
              suggestionList: moviesSuggestion.data!.moviesSuggestion!));
          return moviesSuggestion;
        } else if (response.data is Map<String, dynamic>) {
          MoviesSuggestion moviesSuggestion =
              MoviesSuggestion.fromJson(response.data);
          emit(MoviesDetailSucsess(
              suggestionList: moviesSuggestion.data!.moviesSuggestion!));
          return moviesSuggestion;
        } else {
          emit(MoviesDetailFaliure(
              errorMessage: response.statusMessage ?? 'Invalid'));
        }
      } else {
        emit(MoviesDetailFaliure(
            errorMessage: response.statusMessage ?? 'Invalid'));
      }
    } on ServerExeptions catch (e) {
      emit(MoviesDetailFaliure(errorMessage: e.errorModel.message));
      print('===== Server Error: ${e.errorModel.message}');
    } catch (e) {
      emit(MoviesDetailFaliure(errorMessage: e.toString()));
     
      print('=*==*=*= General Error: ${e.toString()}');
    }
  }

  void navigateToDetailsScreen(Movies movie, context) {
    Navigator.pushNamed(context, MoviesDetailsPage.id, arguments: movie);
  }
}