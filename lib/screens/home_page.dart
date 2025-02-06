import 'package:flutter/material.dart';
import 'package:movies_app/screens/onbourding_screen/intro_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InroPage(),
    );
  }
}
