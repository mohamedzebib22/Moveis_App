import 'package:flutter/material.dart';
import 'package:movies_app/components/login_page_body.dart';
import 'package:movies_app/models/asset_image.dart';
import 'package:movies_app/models/asset_style.dart';
import 'package:movies_app/widgets/custom_button.dart';
import 'package:movies_app/widgets/custom_divider.dart';
import 'package:movies_app/widgets/custom_text_feild.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String id = 'LoginPage';
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(child: LoginPageBody()),
      ),
    );
  }
}
