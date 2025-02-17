import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/models/asset_style.dart';
import 'package:movies_app/Features/explore_page/data/models/category_movies.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryMovies, required this.isSelected});

 final CategoryMovies categoryMovies;
 final bool isSelected;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: height*0.02),
      padding: EdgeInsets.symmetric(horizontal: width*0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xffF6BD00)),
        color: isSelected ? Color(0xffF6BD00): Colors.transparent
      ),
      child: Text(categoryMovies.name,style: isSelected ? AssetStyle.bold20Black : AssetStyle.bold20Yellow ));
  }
}