import 'package:flutter/material.dart';
import 'package:movies_app/Features/onbourding_page/presentation/views/widgets/custom_intro_widget.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  static String id = 'introPage';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: IntroPageBody(),
    );
  }
}