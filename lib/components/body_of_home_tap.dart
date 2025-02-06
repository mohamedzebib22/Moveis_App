import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/asset_image.dart';
import 'package:movies_app/models/movies_list_model.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(backGroundImage), fit: BoxFit.fill)),
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
                      widget.moviesList[index].backgroundImage ?? 'asset/image/intropage3.png';
                });
              },
            ),
            itemCount: widget.moviesList.length,
            itemBuilder: (context, itemIndex, int pageViewIndex) {
              Movies movie = widget.moviesList[itemIndex];
              return ImageListMovies(
                  imageSrc: movie.backgroundImageOriginal ?? 'asset/image/intropage3.png',
                  titleRate: movie.rating ?? 0.0);
            },
          ),
          Image.asset(
            ImagesApp.watchNow,
            width: widget.width * 0.82,
            height: widget.height * 0.15,
          ),
        ],
      ),
    );
  }
}
