import 'package:flutter/material.dart';
import 'package:movies_app/models/asset_style.dart';
import 'package:movies_app/models/movies_suggestion.dart';
import 'package:movies_app/widgets/image_list_movies.dart';

class MoviesSuggestionSection extends StatelessWidget {
  const MoviesSuggestionSection({
    super.key,
    required this.height,
    required this.itemCountList,
    required this.suggestionList,
  });

  final double height;
  final int itemCountList;
  final suggestionList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Similar',
          style: AssetStyle.bold20white,
        ),
        SizedBox(
          height: height * .52,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: itemCountList,
            //state.suggestionList?.length,
            itemBuilder: (context, index) {
              Suggestion movieSuggestion = suggestionList[index];
              return ImageListMovies(
                imageSrc: movieSuggestion.mediumCoverImage ??
                    'asset/image/intropage3.png',
                titleRate: movieSuggestion.rating ?? 0.0,
              );
            },
          ),
        ),
      ],
    );
  }
}
