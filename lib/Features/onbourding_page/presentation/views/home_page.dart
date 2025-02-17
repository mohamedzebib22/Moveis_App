import 'package:flutter/material.dart';
import 'package:movies_app/Features/onbourding_page/presentation/views/widgets/custom_intro_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomIntroPageBody(),
    );
  }
}
