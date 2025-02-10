

import 'package:movies_app/models/movies_details.dart';
import 'package:movies_app/models/movies_list_model.dart';

abstract class MoviesDetailsState {}

 class MoviesDetailsInitial extends MoviesDetailsState {}
 class MoviesDetailsLoading extends MoviesDetailsState {}
 class MoviesDetailSucsess extends MoviesDetailsState {
Movie moveisList;
MoviesDetailSucsess({required this.moveisList});
 }
 class MoviesDetailFaliure extends MoviesDetailsState {
   String errorMessage;
   MoviesDetailFaliure({required this.errorMessage});
 }
