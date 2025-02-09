import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/onbourding_cubit/onbourding_cubit.dart';
import 'package:movies_app/cubits/onbourding_cubit/onbourding_state.dart';
import 'package:movies_app/widgets/custom_bottom_sheet.dart';
import 'package:movies_app/widgets/custom_button.dart';

class OnbourdingScreen extends StatelessWidget {
  const OnbourdingScreen({super.key});
  static String id = 'onBourdingPage';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnbourdingCubit, OnbourdingState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<OnbourdingCubit>(context);
        final currentContent = cubit.contentList[cubit.selectIndex];
        return SafeArea(
          child: Scaffold(
            body: Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: AssetImage(currentContent['image'] ?? ''
                        //OnbourdingModel.imageList[index].image
                        ),
                    fit: BoxFit.fill,
                  )),
              child: cubit.selectIndex == 0
                  ? CustomBottomSheetOnBourding(
                      title: currentContent['title']!,
                      supTitle: currentContent['subtitle']!,
                      onNextTap: () {
                        cubit.onFirstClick();
                      },
                    )
                  : CustomBottomSheetOnBourding(
                      title: currentContent['title']!,
                      supTitle: currentContent['subtitle']!,
                      onNextTap: () {
                        cubit.onNextTap(context);
                      },
                      backButton: CustomButton(title: 'Back'),
                      onBackTap: () {
                        cubit.onBackTap();
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
