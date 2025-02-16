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
import 'package:movies_app/screens/web_view_page.dart';
import 'package:movies_app/widgets/custom_button.dart';
import 'package:movies_app/widgets/custom_details.dart';
import 'package:movies_app/widgets/custom_gener_item.dart';
import 'package:movies_app/widgets/image_list_movies.dart';
import 'package:movies_app/widgets/sections_of_details_movies/description_section.dart';
import 'package:movies_app/widgets/sections_of_details_movies/details_play_section.dart';
import 'package:movies_app/widgets/sections_of_details_movies/movies_suggesion_section.dart';
import 'package:movies_app/widgets/sections_of_details_movies/screenshot_section.dart';

class MoviesDetailsUi extends StatefulWidget {
  const MoviesDetailsUi({super.key});
  static String id = 'MoviesDetailsScreen';

  @override
  State<MoviesDetailsUi> createState() => _MoviesDetailsUiState();
}

class _MoviesDetailsUiState extends State<MoviesDetailsUi> {
  String errorImage ='https://cdn.pixabay.com/photo/2016/04/24/22/30/monitor-1350918_1280.png';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var args = ModalRoute.of(context)?.settings.arguments as Movies;
    dynamic id = args.id!;

    print('********The id is ${id}********');
    BlocProvider.of<MoviesDetailsCubit>(context).getMoveisDetails(id: id);
    //-----------------------------------------------
    BlocProvider.of<MoviesDetailsCubit>(context).getMoviesSuggesion(id: id);

    return Scaffold(
      body: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
        builder: (context, state) {
          if (state is MoviesDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MoviesDetailSucsess) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(args.largeCoverImage!),
                      fit: BoxFit.fill)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02, vertical: height * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DetailsPlaySection(
                          onTap: () {
                            Navigator.pushNamed(context, WebviewScreen.id,
                                arguments: args);
                          },
                          title: args.titleEnglish!,
                          year: args.year!,
                          like: state.detailsMovie?.likeCount ?? 0,
                          runtime: args.runtime ?? 0,
                          rating: args.rating!),
                      ScreenshotSection(screenShotImage1: args.largeCoverImage ?? errorImage, screenShotImage2: args.backgroundImage ?? errorImage, screenShotImage3: args.largeCoverImage ?? errorImage),
                     
                      MoviesSuggestionSection(height: height, itemCountList: state.suggestionList?.length ??0, suggestionList: state.suggestionList),

                      DescriptionSection(titleEnglish: args.titleEnglish ?? 'NotFound', itemCountDetails: args.genres?.length ??0, type: args.genres)
                     
                    ],
                  ),
                ),
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

/**
 
 SizedBox(
                        height: height * .4,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, WebviewScreen.id,
                              arguments: args);
                        },
                        child: Icon(
                          Icons.play_circle,
                          color: Colors.yellow,
                          size: 95,
                        ),
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
 */