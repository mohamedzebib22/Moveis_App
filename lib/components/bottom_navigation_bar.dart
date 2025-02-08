// import 'package:flutter/material.dart';
// import 'package:movies_app/screens/list_moveis_ui.dart';

// class BottomNavigationBar extends StatefulWidget {
//   const BottomNavigationBar({super.key});

//   @override
//   State<BottomNavigationBar> createState() => _BottomNavigationBarState();
// }

// class _BottomNavigationBarState extends State<BottomNavigationBar> {
//   int currentIndex = 0;
//   List<Widget> body = [
//     ListMoveisUi(),
//     SearchPage(),
//     ExplorePage(),
//     UpdateProfilePage(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: body[currentIndex],
//       extendBody: true,
//       bottomNavigationBar: Container(
//         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         padding: EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           color: Color(0xff282A28),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Color(0xff282A28),
//           selectedItemColor: Colors.yellow,
//           unselectedItemColor: Colors.white,
//           elevation: 0,
//           currentIndex:currentIndex,
//           onTap: (int newIndex){
//             setState(() {
//               currentIndex = newIndex;
//             });
//           },
//           items: const [
//             BottomNavigationBarItem(icon: ImageIcon(AssetImage('asset/icons/home.png')), label: ''),
//             BottomNavigationBarItem(icon: ImageIcon(AssetImage('asset/icons/search.png')), label: ''),
//             BottomNavigationBarItem(icon: ImageIcon(AssetImage('asset/icons/explore.png')), label: ''),
//             BottomNavigationBarItem(icon: ImageIcon(AssetImage('asset/icons/Profiel.png')), label: ''),
//           ],
//         ),
//       ),
//     );
//   }
// }