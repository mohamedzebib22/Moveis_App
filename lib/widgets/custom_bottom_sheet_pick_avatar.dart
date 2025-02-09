import 'package:flutter/material.dart';
import 'package:movies_app/models/asset_image.dart';
import 'package:movies_app/widgets/custom_pick_avatar.dart';

class CustomBottomSheetPickAvatar extends StatelessWidget {
  const CustomBottomSheetPickAvatar({
    super.key,
    required this.width,
    required this.height, required this.changeImage,
  });

  final double width;
  final double height;
  final Function(String) changeImage;
  @override
  Widget build(BuildContext context) {
    return GridView(
      
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: width*0.48,
         childAspectRatio: 2/2.3,
         crossAxisSpacing: 5,
         mainAxisSpacing: 5,
      ),
      children: [
        CustomPickAvatar(width: width, height: height, image: ImagesApp.avatar1, onTap: () {
          changeImage(ImagesApp.avatar1);
          },),
        CustomPickAvatar(width: width, height: height,image: ImagesApp.avatar2, onTap: () { changeImage(ImagesApp.avatar2); },),
        CustomPickAvatar(width: width, height: height,image: ImagesApp.avatar3, onTap: () { changeImage(ImagesApp.avatar3); },),
        CustomPickAvatar(width: width, height: height,image: ImagesApp.avatar4, onTap: () { changeImage(ImagesApp.avatar4); },),
        CustomPickAvatar(width: width, height: height,image: ImagesApp.avatar5, onTap: () {changeImage(ImagesApp.avatar5);  },),
        CustomPickAvatar(width: width, height: height,image: ImagesApp.avatar6, onTap: () { changeImage(ImagesApp.avatar6); },),
        CustomPickAvatar(width: width, height: height,image: ImagesApp.avatar7, onTap: () { changeImage(ImagesApp.avatar7); },),
        CustomPickAvatar(width: width, height: height,image: ImagesApp.avatar8, onTap: () { changeImage(ImagesApp.avatar8); },),
        CustomPickAvatar(width: width, height: height,image: ImagesApp.avatar9, onTap: () { changeImage(ImagesApp.avatar9); },),
      ],
    );
  }
}

