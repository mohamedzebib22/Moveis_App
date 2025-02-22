import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/defualt_page/presentation/views/bottom_navigation_bar.dart';
import 'package:movies_app/Features/profile_page/data/cubit/update_profile_cubit/update_profile_cubit.dart';
import 'package:movies_app/Features/profile_page/presentation/views/profile_page.dart';
import 'package:movies_app/Features/profile_page/presentation/views/updateProfile.dart';
import 'package:movies_app/core/api/dio_consumer.dart';
import 'package:movies_app/core/helper/cach_helper.dart';
import 'package:movies_app/Features/explore_page/data/cubit/explore_category_movies_cubit/category_movies_cubit.dart';
import 'package:movies_app/Features/movies_details_page/data/cubit/movies_details_cubit/movies_details_cubit.dart';
// import 'package:movies_app/Features/update_profile_page/data/cubit/update_profile_cubit/update_profile_cubit.dart';
import 'package:movies_app/core/utils/cubits/list_moveis_cubit/list_moveis_cubit.dart';

import 'package:movies_app/Features/register_page/data/cubit/register_cubit/register_cubit.dart';
import 'package:movies_app/Features/login_page/data/cubit/login_cubit/login_cubit.dart';
import 'package:movies_app/Features/onbourding_page/data/cubit/onbourding_cubit/onbourding_cubit.dart';
import 'package:movies_app/Features/register_page/data/cubit/register_cubit/register_cubit.dart';

import 'package:movies_app/Features/explore_page/presentation/views/explore_page.dart';

import 'package:movies_app/Features/forget_password_page/presentation/views/forget_password_page.dart';
import 'package:movies_app/Features/onbourding_page/presentation/views/home_page.dart';
import 'package:movies_app/Features/login_page/presentation/views/login_page.dart';
import 'package:movies_app/Features/movies_details_page/presentation/views/movies_details_page.dart';
import 'package:movies_app/Features/onbourding_page/presentation/views/onbourding_screen.dart';
import 'package:movies_app/Features/register_page/presentation/views/register_page.dart';
import 'package:movies_app/Features/list_movies_tap_page/presentation/views/list_moveis_ui.dart';
import 'package:movies_app/Features/search_page/presentation/views/search_page.dart';
// import 'package:movies_app/Features/update_profile_page/presentation/views/updateProfile.dart';
import 'package:movies_app/Features/web_view_screen/presentation/views/web_view_page.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  CachHelper().init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => OnbourdingCubit()),
    BlocProvider(create: (context) => UpdateProfileCubit()),
    BlocProvider(create: (context) => LoginCubit(DioConsumer(dio: Dio()))),
    BlocProvider(create: (context) => RegisterCubit(DioConsumer(dio: Dio()))),
    BlocProvider(create: (context) => ListMoveisCubit(DioConsumer(dio: Dio()))),
    BlocProvider(create: (context) => MoviesDetailsCubit(DioConsumer(dio: Dio()))),
    BlocProvider(create: (context) => CategoryMoviesCubit(DioConsumer(dio: Dio()))),
  ], child: const MoviesApp()));
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.id: (context) => LoginPage(),
        OnbourdingScreen.id: (context) => OnbourdingScreen(),
        HomePage.id: (context) => HomePage(),
        RegisterPage.id: (context) => RegisterPage(),
        ForgetPasswordPage.id: (context) => ForgetPasswordPage(),
        ListMoveisUi.id: (context) => ListMoveisUi(),
        SearchPage.id: (context) => SearchPage(),
        ExplorePage.id: (context) => ExplorePage(),
        ProfilePage.id: (context) => ProfilePage(), 
        UpddateProfile.id: (context) => UpddateProfile(),
        DefualtPage.id : (context) => DefualtPage(),
        MoviesDetailsPage.id : (context) => MoviesDetailsPage(),
        // WebviewScreen.id : (context) => WebviewScreen(),
        
      },
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
    );
  }
}
