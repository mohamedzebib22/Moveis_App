import 'package:flutter/material.dart';

class CustomScreenShotImage extends StatelessWidget {
  const CustomScreenShotImage({
    super.key,
    required this.screenShot,
  });

  final String screenShot;
  

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      
      decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow, width: 2),
          borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          screenShot,
          fit: BoxFit.fill,
          height: height * 0.17,
        ),
      ),
    );
  }
}
