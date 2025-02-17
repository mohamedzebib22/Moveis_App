import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/update_profile_page/data/cubit/update_profile_cubit/update_profile_cubit.dart';
import 'package:movies_app/Features/update_profile_page/data/cubit/update_profile_cubit/update_profile_state.dart';
import 'package:movies_app/Features/update_profile_page/presentation/views/widgets/custom_bottom_sheet_pick_avatar.dart';
import 'package:movies_app/core/utils/widgets/custom_button.dart';
import 'package:movies_app/core/utils/widgets/custom_text_feild.dart';

class UpdateProfileBody extends StatelessWidget {
  const UpdateProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<UpdateProfileCubit>(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Center(
                  child: Text(
                'pick Avatar',
                style: TextStyle(fontSize: 16, color: Colors.yellow),
              )),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02, vertical: height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: const Color(0xff282A28),
                          builder: (context) => CustomBottomSheetPickAvatar(
                              width: width,
                              height: height,
                              changeImage: (String newAvatar) {
                                cubit.changeAvatar(newAvatar, context);
                              }),
                        );
                      },
                      child: Image.asset(
                        cubit.currentAvatar,
                        width: width * 0.36,
                        height: height * 0.17,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFeild(
                        prefix: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 24,
                        ),
                        borderColor: Colors.black,
                        hintText: 'John Safwat'),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTextFeild(
                        prefix: Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 24,
                        ),
                        borderColor: Colors.black,
                        hintText: '01200000000'),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Reset Password',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .09,
                    ),
                    CustomButton(
                      itemColor: Color(0xFFE82626),
                      textColor: Colors.white,
                      title: 'Delete Account',
                    ),
                    CustomButton(
                      itemColor: Color(0xFFF6BD00),
                      textColor: Colors.white,
                      title: 'Update Data',
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
