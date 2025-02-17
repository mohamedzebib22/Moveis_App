import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/components/bottom_navigation_bar.dart';
import 'package:movies_app/core/api/dio_consumer.dart';
import 'package:movies_app/core/helper/cach_helper.dart';
import 'package:movies_app/cubits/category_movies_cubit/category_movies_cubit.dart';
import 'package:movies_app/cubits/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_app/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:movies_app/cubits/list_moveis_cubit/list_moveis_cubit.dart';

import 'package:movies_app/cubits/register_cubit/register_cubit.dart';
import 'package:movies_app/Features/login_page/data/cubit/login_cubit/login_cubit.dart';
import 'package:movies_app/Features/onbourding_page/data/cubit/onbourding_cubit/onbourding_cubit.dart';
import 'package:movies_app/cubits/register_cubit/register_cubit.dart';

import 'package:movies_app/screens/explore_page.dart';

import 'package:movies_app/screens/forget_password_page.dart';
import 'package:movies_app/screens/home_page.dart';
import 'package:movies_app/Features/login_page/presentation/views/login_page.dart';
import 'package:movies_app/screens/movies_details_ui.dart';
import 'package:movies_app/Features/onbourding_page/presentation/views/intro_page.dart';
import 'package:movies_app/Features/onbourding_page/presentation/views/onbourding_screen.dart';
import 'package:movies_app/screens/register_page.dart';
import 'package:movies_app/screens/list_moveis_ui.dart';
import 'package:movies_app/screens/search_page.dart';
import 'package:movies_app/screens/updateProfile.dart';
import 'package:movies_app/screens/web_view_page.dart';


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
        IntroPage.id: (context) => IntroPage(),
        HomePage.id: (context) => HomePage(),
        RegisterPage.id: (context) => RegisterPage(),
        ForgetPasswordPage.id: (context) => ForgetPasswordPage(),
        ListMoveisUi.id: (context) => ListMoveisUi(),
        SearchPage.id: (context) => SearchPage(),
        ExplorePage.id: (context) => ExplorePage(),
        UpddateProfile.id: (context) => UpddateProfile(),
        DefualtPage.id : (context) => DefualtPage(),
        MoviesDetailsUi.id : (context) => MoviesDetailsUi(),
        WebviewScreen.id : (context) => WebviewScreen(),
        
      },
      debugShowCheckedModeBanner: false,
      initialRoute: IntroPage.id,
    );
  }
}
