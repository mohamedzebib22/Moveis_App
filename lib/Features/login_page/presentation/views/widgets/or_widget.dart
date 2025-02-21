import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/models/asset_style.dart';
import 'package:movies_app/Features/login_page/presentation/views/widgets/custom_divider.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomDivider(),
        Text(
          'Or',
          style: AssetStyle.regular14white,
        ),
        CustomDivider()
      ],
    );
  }
}
