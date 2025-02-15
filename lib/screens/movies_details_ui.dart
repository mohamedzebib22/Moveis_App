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
import 'package:movies_app/widgets/custom_details.dart';
import 'package:movies_app/widgets/custom_gener_item.dart';
import 'package:movies_app/widgets/image_list_movies.dart';

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
      body: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
        builder: (context, state) {
          if (state is MoviesDetailsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MoviesDetailSucsess) {
            int likeCount = state.detailsMovie?.likeCount ?? 0;
            return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(args.largeCoverImage!),
                        fit: BoxFit.fill)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: height * .4,
                      ),
                      Icon(
                        Icons.play_circle,
                        color: Colors.yellow,
                        size: 95,
                      ),
                      Text(
                        args.titleLong ?? 'UnkownTitle',
                        style: AssetStyle.bold20white,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      Text('${args.year}' ?? 'UnkouwnYear',
                          style: AssetStyle.regular18grey,
                          textAlign: TextAlign.center,
                          maxLines: 2),
                      CustomButton(
                          title: 'Watch',
                          textColor: Colors.white,
                          itemColor: Colors.red),
                      Row(
                        children: [
                          Expanded(
                              child: CustomDetails(
                                  icon: Icons.favorite,
                                  details: state.detailsMovie?.likeCount ?? 0)),
                          Expanded(
                              child: CustomDetails(
                                  icon: Icons.schedule,
                                  details: state.detailsMovie?.runtime ?? 0)),
                          Expanded(
                              child: CustomDetails(
                                  icon: Icons.star,
                                  details: state.detailsMovie?.rating ?? 0)),
                        ],
                      ),
                      Text(
                        'ScreenShot',
                        style: AssetStyle.bold20white,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(16)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            state.detailsMovie?.largeCoverImage ??
                                args.backgroundImage!,
                            fit: BoxFit.fill,
                            height: height * 0.17,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(16)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            state.detailsMovie?.backgroundImage ??
                                args.backgroundImage!,
                            fit: BoxFit.fill,
                            height: height * 0.17,
                          ),
                        ),
                      ),
                      
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(16)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            state.detailsMovie?.largeCoverImage ??
                                args.backgroundImage!,
                            fit: BoxFit.fill,
                            height: height * 0.17,
                          ),
                        ),
                      ),
                      Text(
                        'Similar',
                        style: AssetStyle.bold20white,
                      ),
                      SizedBox(
                        height: height * .67,
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                          itemCount: state.suggestionList?.length,
                          itemBuilder: (context, index) {
                            Suggestion movieSuggestion =
                                state.suggestionList![index];
                            return ImageListMovies(
                                imageSrc: movieSuggestion.mediumCoverImage ??
                                    'asset/image/intropage3.png',
                                titleRate: movieSuggestion.rating ?? 0.0);
                          },
                        ),
                      ),
                      Text('Sammary',style: AssetStyle.bold20white,),
                      Text(args.titleEnglish??'UnkownDesc',style: AssetStyle.bold20white,),
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: height*0.24,
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                              itemCount: args.genres!.length,
                              itemBuilder: (context,index){
                                return CustomGenerItem(type: args.genres![index]);
                            }),
                          ),
                        ],
                      ),
                      SizedBox(height: height*.14,)
                     
                    ],
                  ),
                ));
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


/**
 
 CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.5,
                        aspectRatio: 16 / 15,
                        initialPage: 2,
                      ),
                      itemCount: state.suggestionList!.length,
                      itemBuilder: (context, itemIndex, int pageViewIndex) {
                        Suggestion movieSuggestion =
                            state.suggestionList![itemIndex];
                        return ImageListMovies(
                            imageSrc: movieSuggestion.mediumCoverImage ??
                                'asset/image/intropage3.png',
                            titleRate: movieSuggestion.rating ?? 0.0);
                      },
                    ),
 */