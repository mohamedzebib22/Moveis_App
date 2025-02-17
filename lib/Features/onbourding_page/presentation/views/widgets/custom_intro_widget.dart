import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/models/asset_style.dart';
import 'package:movies_app/models/onbourding_model.dart';
import 'package:movies_app/Features/onbourding_page/presentation/views/onbourding_screen.dart';
import 'package:movies_app/core/utils/widgets/custom_button.dart';

class IntroPageBody extends StatelessWidget {
  const IntroPageBody({super.key, });
  
  //String image;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: AssetImage('asset/image/intropage1.png'
                  //OnbourdingModel.imageList[index].image
                  ),
                fit: BoxFit.fill,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('     Find Your Next\nFavorite Movie Here' , style: AssetStyle.medium36white,),
              SizedBox(height: height*.02,),
              Text('Get access to a huge library of movies\nto suit all tastes. You will surely like it.',style: AssetStyle.regular20white,),
              CustomButton(onTap: (){
                Navigator.pushNamed(context,OnbourdingScreen.id,);
              }, title: 'Explore',),
            ],
          ),
        );
      
    
  }
}
