import 'package:flutter/material.dart';
import 'package:movies_app/Features/explore_page/presentation/views/explore_page.dart';
import 'package:movies_app/Features/list_movies_tap_page/presentation/views/list_moveis_ui.dart';
import 'package:movies_app/Features/profile_page/presentation/views/profile_page.dart';
import 'package:movies_app/Features/profile_page/presentation/views/updateProfile.dart';
import 'package:movies_app/Features/search_page/presentation/views/search_page.dart';
// import 'package:movies_app/Features/update_profile_page/presentation/views/updateProfile.dart';

class DefualtPage extends StatefulWidget {
  const DefualtPage({super.key});

  static String id ='DefualtPage';
  @override
  State<DefualtPage> createState() => _DefualtPageState();
}

class _DefualtPageState extends State<DefualtPage> {
  int currentIndex = 0;
  List<Widget> body = [
    ListMoveisUi(),
    SearchPage(),
    ExplorePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff282A28),
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        elevation: 0,
        currentIndex:currentIndex,
        onTap: (int newIndex){
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
        ],
      ),
    );
  }
}
