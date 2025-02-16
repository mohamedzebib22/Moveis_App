import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/category_movies_cubit/category_movies_cubit.dart';
import 'package:movies_app/cubits/category_movies_cubit/category_movies_state.dart';
import 'package:movies_app/models/category_movies.dart';
import 'package:movies_app/widgets/category_item.dart';
import 'package:movies_app/widgets/image_list_movies.dart';

class CategoryPageMovies extends StatefulWidget {
  const CategoryPageMovies({super.key});

  @override
  State<CategoryPageMovies> createState() => _CategoryPageMoviesState();
}

class _CategoryPageMoviesState extends State<CategoryPageMovies> {
  int selectedIndex = 0;
  List<CategoryMovies> categoryListId = CategoryMovies.categoryList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CategoryMoviesCubit>(context).getMoveis(categoryId: categoryListId[selectedIndex].categoryId);
    print(categoryListId[selectedIndex].categoryId);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: CategoryMovies.categoryList.length,
            child: TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {
                    BlocProvider.of<CategoryMoviesCubit>(context).getMoveis(categoryId: categoryListId[selectedIndex].categoryId);
                    print('==============${categoryListId[selectedIndex].categoryId}===========');
                  });
                  
                },
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: CategoryMovies.categoryList.map((name) {
                  return CategoryItem(
                    categoryMovies: name,
                    isSelected:
                        selectedIndex == CategoryMovies.categoryList.indexOf(name),
                  );
                }).toList())),
          
        BlocBuilder<CategoryMoviesCubit, CategoryMoviesState>(
          builder: (context, state) {
            if(state is CategoryMoviesLoading){
              return Center(child: CircularProgressIndicator(),);

            }else if(state is CategoryMoviesSucsess){
              var categoryList = state.moveisList;
              return Expanded(child: ListView.builder(itemBuilder: (context,index){
                  return ImageListMovies(imageSrc: categoryList[index].largeCoverImage!, titleRate: categoryList[index].rating!);
                }));


            }else if(state is CategoryMoviesFaliure){
              return Center(child: Text(state.errorMessage),);
            }
            return Center(child: Text('Opps There Was in Error'),);
            
          },
        )
      ],
    );
  }
}
