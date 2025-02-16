import 'package:flutter/material.dart';
import 'package:movies_app/models/asset_style.dart';
import 'package:movies_app/widgets/custom_screen_shot_Image.dart';

class ScreenshotSection extends StatelessWidget {
  const ScreenshotSection({super.key, required this.screenShotImage1, required this.screenShotImage2, required this.screenShotImage3});
  final String screenShotImage1;
  final String screenShotImage2;
  final String screenShotImage3;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'ScreenShot',
          style: AssetStyle.bold20white,
        ),
        CustomScreenShotImage(screenShot: screenShotImage1),
        SizedBox(
          height: height * .02,
        ),
       CustomScreenShotImage(screenShot: screenShotImage2),
       SizedBox(
          height: height * .02,
        ),
       CustomScreenShotImage(screenShot: screenShotImage3),
      ],
    );
  }
}

