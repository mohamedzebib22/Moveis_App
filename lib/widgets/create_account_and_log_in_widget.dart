import 'package:flutter/material.dart';
import 'package:movies_app/components/register_page_body.dart';
import 'package:movies_app/models/asset_style.dart';

class CreateAccountAndLoginWidget extends StatelessWidget {
  const CreateAccountAndLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t Have Account?',
          style: AssetStyle.regular14white,
        ),
        TextButton(
          onPressed: () {Navigator.pushReplacementNamed(context, RegisterPageBody.id);},
          child: Text(
            'CreateAccount',
            style: AssetStyle.regular14Yellow,
          ),
        ),
      ],
    );
  }
}