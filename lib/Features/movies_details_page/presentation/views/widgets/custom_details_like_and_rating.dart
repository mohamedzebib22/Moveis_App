import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/models/asset_style.dart';

class CustomDetailsLikeAndRating extends StatelessWidget {
  const CustomDetailsLikeAndRating({super.key, required this.icon,required this.details});
  final IconData icon;
  final dynamic details;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width*0.02),
      padding:  EdgeInsets.symmetric(horizontal: width*0.04),
      width: width*0.28,
      height: height*0.05,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
      ),child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon , color: Colors.yellow,size: 28,),
          SizedBox(width: width*0.02,),
          Text('$details' ,style: AssetStyle.bold20white,),
        ],
      ),
    );
  }
}