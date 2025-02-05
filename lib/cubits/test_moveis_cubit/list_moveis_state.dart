


import 'package:movies_app/models/movies_list_model.dart';

abstract class TestMoveisState {}

class TestMoveisInitial extends TestMoveisState {}
class TestMoveisLoading extends TestMoveisState {}
class TestMoveisSucsess extends TestMoveisState {
  List<Movies> moveisList ;
  TestMoveisSucsess({required this.moveisList});
}
class TestMoveisFaliure extends TestMoveisState {
  String errorMessage ;
  TestMoveisFaliure({required this.errorMessage});
}

