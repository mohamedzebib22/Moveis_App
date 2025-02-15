import 'package:carousel_slider/carousel_slider.dart';
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
import 'package:movies_app/models/movies_suggestion.dart';
import 'package:movies_app/widgets/custom_button.dart';
import 'package:movies_app/widgets/image_list_movies.dart';
import 'package:movies_app/widgets/play_movie.dart';

class MoviesDetailsUi extends StatefulWidget {
  const MoviesDetailsUi({super.key});
  static String id = 'MoviesDetailsScreen';

  @override
  State<MoviesDetailsUi> createState() => _MoviesDetailsUiState();
}

class _MoviesDetailsUiState extends State<MoviesDetailsUi> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var args = ModalRoute.of(context)?.settings.arguments as Movies;
    int id = args.id!;
    print('********The id is ${id}********');
    BlocProvider.of<MoviesDetailsCubit>(context).getMoveisDetails(id: id);
    //-----------------------------------------------
    BlocProvider.of<MoviesDetailsCubit>(context).getMoviesSuggesion(id: id);

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
        builder: (context, state) {
          if (state is MoviesDetailsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MoviesDetailSucsess) {
            // print('Image URL: ${state.moveisDetails}');
            // print('Description: ${state.moveisDetails!.descriptionFull}');
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(args.largeCoverImage!),
                      // width: double.infinity,
                      // height: height * 1,
                      fit: BoxFit.fill)),
                      child:CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.5,
                aspectRatio: 16 / 15,
                initialPage: 2,
              ),
              itemCount: state.suggestionList!.length,
              itemBuilder: (context, itemIndex, int pageViewIndex) {
               Suggestion movieSuggestion = state.suggestionList![itemIndex];
                return ImageListMovies(
                    imageSrc:
                        movieSuggestion.mediumCoverImage ?? 'asset/image/intropage3.png',
                    titleRate: movieSuggestion.rating ?? 0.0);
              },
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


        // PlayMovie(),


        // CustomButton(
        //         itemColor: Color(0xFFE82626),
        //         textColor: Colors.white,
        //         title: 'Watch',
        //       ),


      ),
    );
  }
}
