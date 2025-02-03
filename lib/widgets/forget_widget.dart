import 'package:flutter/material.dart';
import 'package:movies_app/models/asset_style.dart';

class ForgetWidget extends StatelessWidget {
 ForgetWidget({super.key , required this.onTap});
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            'ForgetPaswword?',
            style: AssetStyle.regular14Yellow,
          ),
        ),
      ],
    );
  }
}
