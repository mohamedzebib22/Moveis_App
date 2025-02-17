import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/models/asset_style.dart';
import 'package:movies_app/Features/movies_details_page/presentation/views/widgets/custom_gener_item.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.titleEnglish, required this.itemCountDetails, required this.type});
  final String titleEnglish;
  final int itemCountDetails;
  final List<String>? type;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Sammary',
          style: AssetStyle.bold20white,
        ),
        Text(
          titleEnglish,
          style: AssetStyle.bold20white,
        ),
        Column(
          children: [
            Container(
              width: double.infinity,
              height: height * 0.24,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: itemCountDetails,
                  itemBuilder: (context, index) {
                    return CustomGenerItem(type: type![index]);
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
