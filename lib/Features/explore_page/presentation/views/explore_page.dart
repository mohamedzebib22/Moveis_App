import 'package:flutter/material.dart';
import 'package:movies_app/Features/explore_page/presentation/views/widgets/body_of_category_tap.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});
  static String id = 'ExplorePage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: BodyOfCategoryTap(),));
  }
}