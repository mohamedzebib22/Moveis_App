import 'package:flutter/material.dart';

class ImageListMovies extends StatelessWidget {
  ImageListMovies({
    super.key,
    required this.imageSrc,
    required this.titleRate,
  });

  String imageSrc;
  double titleRate;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Container(
          width: width * 0.50,
          height: height * .50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: NetworkImage(imageSrc), fit: BoxFit.fill),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.02),
          width: width * 0.13,
          height: height * 0.03,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              border: Border.all(color: Colors.yellow, width: 1)),
          child: Row(
            children: [
              Text(
                '$titleRate',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Icon(
                Icons.star,
                size: 24,
                color: Colors.yellow,
              )
            ],
          ),
        )
      ],
    );
  }
}
