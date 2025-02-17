


 import 'package:movies_app/core/utils/models/movies_list_model.dart';

class CategoryMoviesState {}

 class CategoryMoviesInitial extends CategoryMoviesState {}
 class CategoryMoviesLoading extends CategoryMoviesState {}
 class CategoryMoviesIndexChanged extends CategoryMoviesState {
  int index;
  CategoryMoviesIndexChanged( {required this.index});
 }

class CategoryMoviesSucsess extends CategoryMoviesState {
  List<Movies> moveisList;
  CategoryMoviesSucsess({required this.moveisList});
}

class CategoryMoviesFaliure extends CategoryMoviesState {
  String errorMessage;
  CategoryMoviesFaliure({required this.errorMessage});
}
