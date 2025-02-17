import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/models/asset_style.dart';

class CreateAccountAndLoginWidget extends StatelessWidget {
   CreateAccountAndLoginWidget({super.key ,required this.text1,required this.text2,required this.onTap});
  String text1;
  String text2;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: AssetStyle.regular14white,
        ),
        InkWell(
          onTap:onTap ,
          child: Text(
            text2,
            style: AssetStyle.regular14Yellow,
          ),
        ),
      ],
    );
  }
}
