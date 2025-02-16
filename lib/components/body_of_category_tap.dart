import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/category_movies_cubit/category_movies_cubit.dart';
import 'package:movies_app/cubits/category_movies_cubit/category_movies_state.dart';
import 'package:movies_app/models/asset_style.dart';
import 'package:movies_app/models/category_movies.dart';
import 'package:movies_app/screens/web_view_page.dart';
import 'package:movies_app/widgets/category_item.dart';
import 'package:movies_app/widgets/image_list_movies.dart';

class CategoryPageMovies extends StatefulWidget {
  const CategoryPageMovies({super.key});

  @override
  State<CategoryPageMovies> createState() => _CategoryPageMoviesState();
}

class _CategoryPageMoviesState extends State<CategoryPageMovies> {
  List<CategoryMovies> categoryListId = CategoryMovies.categoryList;
  int initialIndex = 0;

  @override
  void initState() {
    super.initState();

    final cubit = BlocProvider.of<CategoryMoviesCubit>(context);
    cubit.getMoveis(categoryId: categoryListId[initialIndex].categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryMoviesCubit, CategoryMoviesState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<CategoryMoviesCubit>(context);
        if (state is CategoryMoviesLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryMoviesSucsess) {
          var categoryList = state.moveisList;
          return Column(
            children: [
              DefaultTabController(
                  length: CategoryMovies.categoryList.length,
                  child: TabBar(
                      onTap: (index) {
                        if (index != initialIndex) {
                          cubit.changeSelectedIndex(index);
                          initialIndex = index;
                          cubit.getMoveis(
                            categoryId: CategoryMovies
                                .categoryList[initialIndex].categoryId,
                          );
                        }
                        print(
                            "The selected category ID is: ${CategoryMovies.categoryList[index].categoryId}");
                      },
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      tabs: CategoryMovies.categoryList.map((name) {
                        return CategoryItem(
                          categoryMovies: name,
                          isSelected: cubit.selectedIndex ==
                              CategoryMovies.categoryList.indexOf(name),
                        );
                      }).toList())),
              Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 2 / 2.8,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              crossAxisCount: 2),
                      itemCount: state.moveisList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            print(categoryList[index].genres);
                            Navigator.pushNamed(context, WebviewScreen.id,
                                arguments: state.moveisList[index]);
                          },
                          child: ImageListMovies(
                              imageSrc: categoryList[index].largeCoverImage ??
                                  'https://cdn.pixabay.com/photo/2016/04/24/22/30/monitor-1350918_1280.png',
                              titleRate: categoryList[index].rating ?? 0.0),
                        );
                      })),
            ],
          );
        } else if (state is CategoryMoviesFaliure) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return Center(
          child: Text(
            'Opps There Was in Error',
            style: AssetStyle.bold20white,
          ),
        );
      },
    );
  }
}
