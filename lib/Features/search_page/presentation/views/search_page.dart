import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/endpoint.dart';
import 'package:movies_app/core/utils/cubits/list_moveis_cubit/list_moveis_cubit.dart';
import 'package:movies_app/core/utils/cubits/list_moveis_cubit/list_moveis_state.dart';
import 'package:movies_app/core/utils/models/asset_image.dart';
import 'package:movies_app/core/utils/models/movies_list_model.dart';
import 'package:movies_app/Features/web_view_screen/presentation/views/web_view_page.dart';
import 'package:movies_app/core/utils/widgets/custom_text_feild.dart';
import 'package:movies_app/core/utils/widgets/image_list_movies.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static String id = 'SearchPage';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String movieFilter = '';
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListMoveisCubit>(context).getMoveis(Endpoint.baseUrlMoveis);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          children: [
            SizedBox(height: height * 0.06),
            CustomTextFeild(
              onChanged: (title) {
                setState(() {
                  movieFilter = title.toLowerCase();
                });
              },
              hintText: 'Search',
              prefix: const Icon(Icons.search, color: Colors.white),
            ),
            Expanded(
              child: BlocBuilder<ListMoveisCubit, ListMoveisState>(
                builder: (context, state) {
                  if (state is ListMoveisLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ListMoveisSucsess) {
                    var movies = state.moveisList;
                    
                    List<Movies> filteredMovies = movies.where((movie) {
                      bool nameFilter =
                          movie.title?.toLowerCase().contains(movieFilter) ??
                              false;
                      bool genresFilter = movie.genres?.any((genre) =>
                              genre.toLowerCase().contains(movieFilter)) ??
                          false;
                      bool yearsFilter=movie.year.toString().contains(movieFilter)?? false;
                      return nameFilter || genresFilter || yearsFilter;
                    }).toList();

                    return movieFilter.isEmpty || movieFilter == null ? Center(child: Image.asset(ImagesApp.iconofsearchpage),) :
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: filteredMovies.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, WebviewScreen.id,arguments:filteredMovies[index] );
                          },
                          child: ImageListMovies(
                              imageSrc:
                                  filteredMovies[index].largeCoverImage ?? '',
                              titleRate: filteredMovies[index].rating ?? 0.0),
                        );
                      },
                    );
                  } else if (state is ListMoveisFaliure) {
                    return Center(
                      child: Text(
                        'Failed to load movies',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
