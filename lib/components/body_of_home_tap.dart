import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_app/models/asset_image.dart';
import 'package:movies_app/models/movies_details.dart';
import 'package:movies_app/models/movies_list_model.dart';
import 'package:movies_app/screens/movies_details_ui.dart';
import 'package:movies_app/widgets/image_list_movies.dart';

class BodyOfHomeTap extends StatefulWidget {
  const BodyOfHomeTap({
    super.key,
    required this.height,
    required this.width,
    required this.moviesList,
  });

  final double height;
  final double width;
  final List<Movies> moviesList;

  @override
  State<BodyOfHomeTap> createState() => _BodyOfHomeTapState();
}

class _BodyOfHomeTapState extends State<BodyOfHomeTap> {
  String backGroundImage = '';
  String genreFilter = 'Drama';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<Movies> filteredMovies = widget.moviesList.where((movie) {
     return movie.genres?.contains(genreFilter) ?? false;
    }).toList();

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: backGroundImage.isEmpty || backGroundImage == null ?AssetImage('asset/image/intropage6.png'):
                NetworkImage(backGroundImage), fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: widget.height * 0.02,
            ),
            Image.asset(
              ImagesApp.availableNow,
              width: widget.width * 0.62,
              height: widget.height * 0.09,
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.5,
                aspectRatio: 16 / 15,
                initialPage: 2,
                onPageChanged: (index, reason) {
                  setState(() {
                    backGroundImage =
                        widget.moviesList[index].largeCoverImage ??
                            'asset/image/intropage3.png';
                    print(
                        'The image is ${widget.moviesList[index].largeCoverImage}');
                        print(
                        'The id is ${widget.moviesList[index].id}');
                        print(
                        'The index is ${index}');
                  });
                },
              ),
              itemCount: widget.moviesList.length,
              itemBuilder: (context, itemIndex, int pageViewIndex) {
                Movies movie = widget.moviesList[itemIndex];
                
                return InkWell(
                  onTap: (){
                    BlocProvider.of<MoviesDetailsCubit>(context).navigateToDetailsScreen(movie, context);
                  },
                  child: ImageListMovies(
                      imageSrc:
                          movie.largeCoverImage ?? 'asset/image/intropage3.png',
                      titleRate: movie.rating ?? 0.0),
                );
              },
            ),
            Image.asset(
              ImagesApp.watchNow,
              width: widget.width * 0.82,
              height: widget.height * 0.15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Action',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.23,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredMovies.length,
                itemBuilder: (context, index) {
                  Movies movie = filteredMovies[index];
                  return InkWell(
                    onTap: (){
                      BlocProvider.of<MoviesDetailsCubit>(context).navigateToDetailsScreen(movie, context);
                    },
                    child: ImageListMovies(
                      imageSrc:
                          movie.largeCoverImage ?? 'asset/image/default.png',
                      titleRate: movie.rating ?? 0.0,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
