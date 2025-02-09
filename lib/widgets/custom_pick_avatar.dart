import 'package:flutter/material.dart';

class CustomPickAvatar extends StatelessWidget {
  const CustomPickAvatar({
    super.key,
    required this.width,
    required this.height, required this.image, required this.onTap,
  });

  final double width;
  final double height;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
        padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
        decoration: BoxDecoration(
          border: Border.all(color:const Color(0xffF6BD00)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onTap,
          child: Image.asset(
            image,
          ),
        ));
  }
}