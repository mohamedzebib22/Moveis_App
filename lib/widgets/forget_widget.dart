import 'package:flutter/material.dart';
import 'package:movies_app/components/forget_password_page.dart';
import 'package:movies_app/models/asset_style.dart';

class ForgetWidget extends StatelessWidget {
  const ForgetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {Navigator.pushReplacementNamed(context, ForgetPasswordPage.id);},
          child: Text(
            'ForgetPaswword?',
            style: AssetStyle.regular14Yellow,
          ),
        ),
      ],
    );
  }
}