import 'package:flutter/material.dart';
import 'package:movies_app/screens/explore_screen.dart';
import 'package:movies_app/screens/list_moveis_ui.dart';
import 'package:movies_app/screens/profile_screen.dart';
import 'package:movies_app/screens/search_screen.dart';

class NavigationSlider extends StatefulWidget {
  static String id = 'BottomNavigationBar';

  @override
  State<NavigationSlider> createState() => _NavigationSliderState();
}

class _NavigationSliderState extends State<NavigationSlider> {
  int myCurrentIndex = 0;
  List<Widget> pages = [
    TestMoveisUi(),
    SearchScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          body: pages[myCurrentIndex]

    );
  }
}