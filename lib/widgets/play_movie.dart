import 'package:flutter/material.dart';

class PlayMovie extends StatelessWidget {
  const PlayMovie({super.key});
  static String id = 'playbtn';


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: width * 0.3,
          height: height * 0.3,
          decoration: BoxDecoration(
            color: Colors.yellow, 
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: width * 0.25,
          height: height * 0.25,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        Icon(
          Icons.play_arrow,
          size: 90,
          color: Colors.yellow, 
        ),
      ],
    );
  }
}