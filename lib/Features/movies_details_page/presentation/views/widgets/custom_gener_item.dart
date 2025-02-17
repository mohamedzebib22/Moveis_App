import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/models/asset_style.dart';
import 'package:movies_app/core/utils/models/movies_list_model.dart';

class CustomGenerItem extends StatelessWidget {
  const CustomGenerItem({
    super.key,
    required this.type,
  });

 // final Movies args;
  final String type;
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
    return Container(  
      width: width*0.30,
      height: height*0.03,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.yellow,width: 2)
      ),
      child: Center(child: Text(type,style: AssetStyle.bold20white,)),
    );
  }
}