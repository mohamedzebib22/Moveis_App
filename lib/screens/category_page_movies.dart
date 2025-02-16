import 'package:flutter/material.dart';
import 'package:movies_app/models/category_movies.dart';
import 'package:movies_app/widgets/category_item.dart';

class CategoryPageMovies extends StatefulWidget {
  const CategoryPageMovies({super.key});
  static String id = 'categoryMovies';

  @override
  State<CategoryPageMovies> createState() => _CategoryPageMoviesState();
}

class _CategoryPageMoviesState extends State<CategoryPageMovies> {
   int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: DefaultTabController(
        length: CategoryMovies.categoryList.length,
       child: TabBar(
        onTap: (index){
          selectedIndex =index;
          setState(() {
            
          });
        },
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        tabs: CategoryMovies.categoryList.map((name){
          return CategoryItem(categoryMovies: name, isSelected: selectedIndex == CategoryMovies.categoryList.indexOf(name),);
        }).toList()
        
        )),
      ),
    );
  }
}