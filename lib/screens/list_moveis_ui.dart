import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/endpoint.dart';
import 'package:movies_app/cubits/test_moveis_cubit/list_moveis_state.dart';
import 'package:movies_app/cubits/test_moveis_cubit/list_moveis_cubit.dart';
import 'package:movies_app/cubits/test_moveis_cubit/list_moveis_state.dart';
import 'package:movies_app/models/movies_list_model.dart';
import 'package:movies_app/screens/explore_screen.dart';
import 'package:movies_app/screens/profile_screen.dart';
import 'package:movies_app/screens/search_screen.dart';

class TestMoveisUi extends StatefulWidget {
  const TestMoveisUi({super.key});
  static String id ='TestMoveisUi';

  @override
  State<TestMoveisUi> createState() => _TestMoveisUiState();
}

class _TestMoveisUiState extends State<TestMoveisUi> {



  int myCurrentIndex = 0;
  List<Widget> pages = [
    TestMoveisUi(),
    SearchScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ];
  


  
  void initState() {
    
    super.initState();
    BlocProvider.of<TestMoveisCubit>(context).getMoveis(Endpoint.baseUrlMoveis);
  }
  @override
  Widget build(BuildContext context) {

    
    // pages[myCurrentIndex];



    return Scaffold(
      body:BlocBuilder<TestMoveisCubit, TestMoveisState>(
        builder: (context, state) {
          if(state is TestMoveisLoading ){
           return Center(child: CircularProgressIndicator(),);
          }
          else if (state is TestMoveisSucsess) {
       
            var moviesList = state.moveisList;
            return ListView.builder(
              itemCount: moviesList.length,
              itemBuilder: (context, index) {
                Movies movie = moviesList[index];
                return Text(movie.title ?? '' ,style: TextStyle(fontSize: 16,color: Colors.black),);
              },
            );
          } else if (state is TestMoveisFaliure) {
            return Center(child: Text(state.errorMessage));
          }
          return Container(child: Text('Invalid'),);
        },
      ),






          extendBody: true,
          bottomNavigationBar:
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(color: Color(0xff282A28),
                borderRadius: BorderRadius.circular(16)
            ),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: myCurrentIndex,
                backgroundColor: Color(0xff282A28),
                selectedItemColor: Colors.yellow,
                unselectedItemColor: Colors.white,
                elevation: 0,
                onTap: (index) {
                  setState(() {
                    myCurrentIndex = index;
                  });
                },
                items: const[
                  BottomNavigationBarItem(icon: ImageIcon(
                    AssetImage('asset/icons/home.png'),), label: ''),
                  BottomNavigationBarItem(icon: ImageIcon(
                      AssetImage('asset/icons/search.png')), label: ''),
                  BottomNavigationBarItem(icon: ImageIcon(
                      AssetImage('asset/icons/explore.png')), label: ''),
                  BottomNavigationBarItem(icon: ImageIcon(
                      AssetImage('asset/icons/Profiel.png')), label: ''),
                ]),
          ),









    );
  }
}