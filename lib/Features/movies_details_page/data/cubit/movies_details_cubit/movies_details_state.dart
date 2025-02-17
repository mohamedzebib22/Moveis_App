

import 'package:movies_app/Features/movies_details_page/data/models/movies_details.dart';
import 'package:movies_app/core/utils/models/movies_list_model.dart';
import 'package:movies_app/Features/movies_details_page/data/models/movies_suggestion.dart';

abstract class MoviesDetailsState {}

 class MoviesDetailsInitial extends MoviesDetailsState {}
 class MoviesDetailsLoading extends MoviesDetailsState {}
 class MoviesDetailSucsess extends MoviesDetailsState {
Movie? detailsMovie;
List<Suggestion>? suggestionList ;
MoviesDetailSucsess({ this.detailsMovie, this.suggestionList});
 }
 class MoviesDetailFaliure extends MoviesDetailsState {
   String errorMessage;
   MoviesDetailFaliure({required this.errorMessage});
 }