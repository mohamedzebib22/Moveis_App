import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/components/forget_password_page.dart';
import 'package:movies_app/components/register_page_body.dart';
import 'package:movies_app/cubits/onbourding_cubit/onbourding_cubit.dart';
import 'package:movies_app/screens/home_page.dart';
import 'package:movies_app/screens/login_page.dart';
import 'package:movies_app/screens/onbourding_screen/intro_page.dart';
import 'package:movies_app/screens/onbourding_screen/onbourding_screen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => OnbourdingCubit()),
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
        RegisterPageBody.id : (context) => RegisterPageBody(),
        ForgetPasswordPage.id : (context) => ForgetPasswordPage(),
        OnbourdingScreen.id : (context) =>OnbourdingScreen(),
        InroPage.id :(context) => InroPage(),
        HomePage.id : (context) => HomePage()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: InroPage.id,
    );
  }
}