import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/models/asset_style.dart';
import 'package:movies_app/core/utils/widgets/custom_button.dart';
import 'package:movies_app/widgets/custom_details_like_and_rating.dart';

class DetailsPlaySection extends StatelessWidget {
  const DetailsPlaySection({super.key, required this.onTap, required this.title, required this.year, required this.like, required this.runtime, required this.rating});
  final VoidCallback onTap;
  final String title;
  final int year;
  final int like;
  final int runtime;
  final dynamic rating;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * .4,
        ),
        InkWell(
          onTap: onTap,
          child: Icon(
            Icons.play_circle,
            color: Colors.yellow,
            size: 95,
          ),
        ),
        Text(
          title ?? 'UnkownTitle',
          style: AssetStyle.bold20white,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        Text('$year' ?? 'UnkouwnYear',
            style: AssetStyle.regular18grey,
            textAlign: TextAlign.center,
            maxLines: 2),
        CustomButton(
            title: 'Watch', textColor: Colors.white, itemColor: Colors.red),
        Row(
          children: [
            Expanded(
                child: CustomDetailsLikeAndRating(
                    icon: Icons.favorite,
                    details: '$like' )),
            Expanded(
                child: CustomDetailsLikeAndRating(
                    icon: Icons.schedule,
                    details: '$runtime')),
            Expanded(
                child: CustomDetailsLikeAndRating(
                    icon: Icons.star,
                    details: '$rating')),
          ],
        ),
      ],
    );
  }
}
