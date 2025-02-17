import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/list_movies_tap_page/presentation/views/widgets/body_of_home_tap.dart';
import 'package:movies_app/core/api/endpoint.dart';
import 'package:movies_app/core/utils/cubits/list_moveis_cubit/list_moveis_state.dart';
import 'package:movies_app/core/utils/cubits/list_moveis_cubit/list_moveis_cubit.dart';
import 'package:movies_app/core/utils/cubits/list_moveis_cubit/list_moveis_state.dart';
import 'package:movies_app/core/utils/models/asset_image.dart';
import 'package:movies_app/core/utils/models/movies_list_model.dart';
import 'package:movies_app/core/utils/widgets/image_list_movies.dart';

class ListMoveisUi extends StatefulWidget {
  const ListMoveisUi({super.key});
  static String id = 'TestMoveisUi';

  @override
  State<ListMoveisUi> createState() => _ListMoveisUiState();
}

class _ListMoveisUiState extends State<ListMoveisUi> {
  void initState() {
    super.initState();
    BlocProvider.of<ListMoveisCubit>(context).getMoveis(Endpoint.baseUrlMoveis);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<ListMoveisCubit, ListMoveisState>(
          builder: (context, state) {
            if (state is ListMoveisLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ListMoveisSucsess) {
              var moviesList = state.moveisList;
              return BodyOfHomeTap(
                  height: height, width: width, moviesList: moviesList);
              
            } else if (state is ListMoveisFaliure) {
              return Center(child: Text(state.errorMessage));
            }
            return Container(
              child: Text('Invalid'),
            );
          },
        ),
      ),
    );
  }
}
