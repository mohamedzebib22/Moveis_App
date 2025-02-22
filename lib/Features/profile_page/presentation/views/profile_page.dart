import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/profile_page/data/cubit/update_profile_cubit/update_profile_cubit.dart';
import 'package:movies_app/Features/profile_page/presentation/views/updateProfile.dart';
import 'package:movies_app/core/utils/widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static String id = 'ProfilePage';

  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var cubit = BlocProvider.of<UpdateProfileCubit>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xff282A28),
          toolbarHeight: height * 0.25,
          title: Row(
                children: [
                  Column(
                    children: [
                      // Image(image: AssetImage('asset/image/avatar1.png'),),
                      Image.asset(cubit.currentAvatar),
                      Text('UserName', style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: 
                          Text('Watched \n 0', style: TextStyle(color: Colors.white),),   
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: 
                          Text('History \n 0', style: TextStyle(color: Colors.white),),   
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomButton(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, UpddateProfile.id);
                        },
                        itemColor: Color(0xFFF6BD00),
                        textColor: Colors.black,
                        title: 'Edit Profile',
                      ),
                      CustomButton(
                        itemColor: Color(0xFFE82626),
                        textColor: Colors.white,
                        title: 'Exit',
                      ),
                    ],
                  ),
                ],
              ),
          bottom: const TabBar(
                  labelColor: Color(0xFFF6BD00),
                  indicatorColor: Color(0xFFF6BD00),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(icon: ImageIcon(AssetImage('asset/icons/watch_list_icon.png'),),),
                    Tab(icon: ImageIcon(AssetImage('asset/icons/history_icon.png'),),),
                  ],),
        ),
        // body: ,
      ),
    );
  }
}
