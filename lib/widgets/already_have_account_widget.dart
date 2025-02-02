import 'package:flutter/material.dart';
import 'package:movies_app/models/asset_style.dart';
import 'package:movies_app/screens/login_page.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already Have Account?',
          style: AssetStyle.regular14white,
        ),
        TextButton(
          onPressed: () {Navigator.pushReplacementNamed(context, LoginPage.id);},
          child: Text(
            'Login',
            style: AssetStyle.regular14Yellow,
          ),
        ),
      ],
    );;
  }
}