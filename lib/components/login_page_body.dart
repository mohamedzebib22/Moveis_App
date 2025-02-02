import 'package:flutter/material.dart';
import 'package:movies_app/models/asset_image.dart';
import 'package:movies_app/models/asset_style.dart';
import 'package:movies_app/widgets/create_account_and_log_in_widget.dart';
import 'package:movies_app/widgets/custom_button.dart';
import 'package:movies_app/widgets/custom_divider.dart';
import 'package:movies_app/widgets/custom_text_feild.dart';
import 'package:movies_app/widgets/forget_widget.dart';
import 'package:movies_app/widgets/or_widget.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
        child: Column(
        children: [
          SizedBox(height: height*0.06,),
          Image.asset(ImagesApp.iconApp,width: width*0.28,height: height*0.12,),
          SizedBox(height: height*0.04,),
          CustomTextFeild(hintText: 'Email' ,prefix: Icon(Icons.email,size: 24,color: Colors.white,),),
          SizedBox(height: height*0.04,),
          CustomTextFeild(hintText: 'Paswword',prefix: Icon(Icons.lock,size: 24,color: Colors.white,),sufix: Icon(Icons.visibility_off,size: 24,color: Colors.white,),),
          SizedBox(height: height*0.04,),
          ForgetWidget(),
          SizedBox(height: height*0.04,),
          CustomButton(title: 'Login'),
          SizedBox(height: height*0.04,),
          CreateAccountAndLoginWidget(),
          SizedBox(height: height*0.04,),
          OrWidget(),
          CustomButton(title: 'Login With Google'),
        ],
        
            ),
      );
  }
}