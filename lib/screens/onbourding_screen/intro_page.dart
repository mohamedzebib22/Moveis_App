import 'package:flutter/material.dart';
import 'package:movies_app/widgets/custom_intro_widget.dart';

class InroPage extends StatelessWidget {
  const InroPage({super.key});
  static String id = 'introPage';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomInroWidget(),
    );
  }
}