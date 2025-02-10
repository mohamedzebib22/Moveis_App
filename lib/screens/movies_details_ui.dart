import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/dio_consumer.dart';
import 'package:movies_app/core/errors/error_model.dart';

import 'package:movies_app/cubits/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_app/cubits/movies_details_cubit/movies_details_state.dart';
import 'package:movies_app/models/asset_style.dart';
import 'package:movies_app/models/movies_details.dart';
import 'package:movies_app/models/movies_list_model.dart';

class MoviesDetailsUi extends StatefulWidget {
  const MoviesDetailsUi({super.key});
  static String id = 'MoviesDetailsScreen';

  @override
  State<MoviesDetailsUi> createState() => _MoviesDetailsUiState();
}

class _MoviesDetailsUiState extends State<MoviesDetailsUi> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Movies;
    int id = args.id!;
    print('********The id is ${id}********');
    BlocProvider.of<MoviesDetailsCubit>(context).getMoveisDetails(id: id);
    return Scaffold(
      body: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
        builder: (context, state) {
          if (state is MoviesDetailsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MoviesDetailSucsess) {
            print('Image URL: ${state.moveisList.largeCoverImage}');
            print('Description: ${state.moveisList.descriptionFull}');
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(args.largeCoverImage!),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'defult',
                    style: AssetStyle.bold20white,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Text(
                              args.descriptionFull ??'' ,
                              style: TextStyle(color: Colors.red,fontSize: 20),
                            );
                          }))
                ],
              ),
            );
          } else if (state is MoviesDetailFaliure) {
            print('Error: ${state.errorMessage}');
            return Text(state.errorMessage);
          }
          return Container(
            child: Center(child: Text('Invalid Are You sure Try Again')),
          );
        },
      ),
    );
  }
}
