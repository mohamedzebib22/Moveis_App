import 'package:flutter/material.dart';

class CustomPickAvatar extends StatelessWidget {
  const CustomPickAvatar({
    super.key,
    required this.width,
    required this.height, required this.image,  this.onTap,
    this.isBorder =true
  });

  final double width;
  final double height;
  final String image;
  final VoidCallback? onTap;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
        padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
        decoration: BoxDecoration(
          border: isBorder ?Border.all(color:const Color(0xffF6BD00)) :Border.all(color:Colors.transparent) ,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onTap,
          child: Image.asset(
            image,
            width: width*0.36,
            height: height*0.17,
            fit: BoxFit.fill,
          ),
        ));
  }
}