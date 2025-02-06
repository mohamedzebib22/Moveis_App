import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/dio_consumer.dart';
import 'package:movies_app/cubits/test_moveis_cubit/list_moveis_cubit.dart';
import 'package:movies_app/cubits/register_cubit/register_cubit.dart';
import 'package:movies_app/cubits/login_cubit/login_cubit.dart';
import 'package:movies_app/cubits/onbourding_cubit/onbourding_cubit.dart';
import 'package:movies_app/cubits/register_cubit/register_cubit.dart';
import 'package:movies_app/cubits/test_moveis_cubit/list_moveis_cubit.dart';
import 'package:movies_app/screens/explore_screen.dart';
import 'package:movies_app/screens/forget_password_page.dart';
import 'package:movies_app/screens/home_page.dart';
import 'package:movies_app/screens/login_page.dart';
import 'package:movies_app/screens/onbourding_screen/intro_page.dart';
import 'package:movies_app/screens/onbourding_screen/onbourding_screen.dart';
import 'package:movies_app/screens/profile_screen.dart';
import 'package:movies_app/screens/register_page.dart';
import 'package:movies_app/screens/list_moveis_ui.dart';
import 'package:movies_app/screens/search_screen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => OnbourdingCubit()),
    BlocProvider(create: (context) => LoginCubit(DioConsumer(dio: Dio()))),
    BlocProvider(create: (context) => RegisterCubit(DioConsumer(dio: Dio()))),
    BlocProvider(create: (context) => TestMoveisCubit(DioConsumer(dio: Dio()))),
  ],
  child: const MoviesApp()));
}
class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.id : (context) => LoginPage(),
        OnbourdingScreen.id : (context) =>OnbourdingScreen(),
        InroPage.id :(context) => InroPage(),
        HomePage.id : (context) => HomePage(),
        RegisterPage.id : (context) => RegisterPage(),
        ForgetPasswordPage.id : (context) => ForgetPasswordPage(),
        TestMoveisUi.id : (context) => TestMoveisUi(),
        SearchScreen.id : (context) => SearchScreen(),
        ExploreScreen.id : (context) => ExploreScreen(),
        ProfileScreen.id : (context) => ProfileScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: InroPage.id,
      // initialRoute: TestMoveisUi.id,
    );
  }
}
