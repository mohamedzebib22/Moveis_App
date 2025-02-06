import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/endpoint.dart';
import 'package:movies_app/cubits/test_moveis_cubit/list_moveis_state.dart';
import 'package:movies_app/cubits/test_moveis_cubit/list_moveis_cubit.dart';
import 'package:movies_app/cubits/test_moveis_cubit/list_moveis_state.dart';
import 'package:movies_app/models/movies_list_model.dart';

class TestMoveisUi extends StatefulWidget {
  const TestMoveisUi({super.key});
  static String id ='TestMoveisUi';

  @override
  State<TestMoveisUi> createState() => _TestMoveisUiState();
}

class _TestMoveisUiState extends State<TestMoveisUi> {
  
  
  void initState() {
    
    super.initState();
    BlocProvider.of<TestMoveisCubit>(context).getMoveis(Endpoint.baseUrlMoveis);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TestMoveisCubit, TestMoveisState>(
        builder: (context, state) {
          if(state is TestMoveisLoading ){
           return Center(child: CircularProgressIndicator(),);
          }
          else if (state is TestMoveisSucsess) {
       
            var moviesList = state.moveisList;
            return ListView.builder(
              itemCount: moviesList.length,
              itemBuilder: (context, index) {
                Movies movie = moviesList[index];
                return Text(movie.title ?? '' ,style: TextStyle(fontSize: 16,color: Colors.black),);
              },
            );
          } else if (state is TestMoveisFaliure) {
            return Center(child: Text(state.errorMessage));
          }
          return Container(child: Text('Invalid'),);
        },
      ),
    );
  }
}
