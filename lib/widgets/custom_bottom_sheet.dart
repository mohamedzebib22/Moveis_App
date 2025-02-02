import 'package:flutter/material.dart';
import 'package:movies_app/models/asset_style.dart';
import 'package:movies_app/widgets/custom_button.dart';

class CustomBottomSheet extends StatelessWidget {
   CustomBottomSheet({super.key ,  this.backButton, this.onNextTap,this.onBackTap,required this.title,required this.supTitle});
  Widget? backButton;
  VoidCallback? onNextTap;
  VoidCallback? onBackTap;
  String title;
  String supTitle;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width:double.infinity ,
      height:backButton == null ? height*0.34:
      height*0.40 ,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(topRight: Radius.circular(26),topLeft: Radius.circular(26))
      ),
      child: backButton == null ?
      Column(
        children: [
          SizedBox(height: height*0.02,),
          Text(title ,style: AssetStyle.bold20white,),
          SizedBox(height: height*0.02,),
          Text(supTitle,style:AssetStyle.regular20white,textAlign: TextAlign.center,),
          Spacer(),
          CustomButton(title: 'Next', onTap: onNextTap,)
        ],
      ):
      Column(
        children: [
          SizedBox(height: height*0.02,),
          Text(title ,style: AssetStyle.bold20white,),
          SizedBox(height: height*0.02,),
          Text(supTitle,style:AssetStyle.regular20white,textAlign: TextAlign.center,),
          Spacer(),
          CustomButton(title: 'Next',onTap: onNextTap,),
          CustomButton(title: 'Back',onTap: onBackTap,itemColor: Colors.transparent,textColor: Colors.yellow,),
        ],
    ),
    );
  }
}