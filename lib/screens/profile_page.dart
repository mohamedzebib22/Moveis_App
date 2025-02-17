import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/update_profile_cubit/update_profile_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static String id = 'ProfilePage';

  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var cubit = BlocProvider.of<UpdateProfileCubit>(context);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xff282A28),
          toolbarHeight: height * 0.25,
          title: Row(
                children: [
                  Column(
                    children: [
                      Image.asset(cubit.currentAvatar),
                    ],
                  ),
                ],
        ),
      ),
    );
  }
}