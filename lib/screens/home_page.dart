import 'package:flutter/material.dart';
import 'package:movies_app/Features/onbourding_page/presentation/views/intro_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroPage(),
    );
  }
}
