import 'package:movies_app/core/utils/models/movies_list_model.dart';

abstract class ListMoveisState {}

class ListMoveisInitial extends ListMoveisState {}

class ListMoveisLoading extends ListMoveisState {}

class ListMoveisSucsess extends ListMoveisState {
  List<Movies> moveisList;
  ListMoveisSucsess({required this.moveisList});
}

class ListMoveisFaliure extends ListMoveisState {
  String errorMessage;
  ListMoveisFaliure({required this.errorMessage});
}
