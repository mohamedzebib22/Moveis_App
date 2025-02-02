import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/cubits/onbourding_cubit/onbourding_state.dart';
import 'package:movies_app/screens/login_page.dart';

class OnbourdingCubit extends Cubit<OnbourdingState> {
  OnbourdingCubit() : super(OnbourdingInitial());

  int selectIndex = 0;
  List<Map<String, String>> contentList = [
    {
      'image': 'asset/image/intropage2.png',
      'title': 'Discover Movies',
      'subtitle':
          'Explore a vast collection of movies in all\nqualities and genres. Find your next\nfavorite film with ease.'
    },
    {
      'image': 'asset/image/intropage3.png',
      'title': 'Explore All Genres',
      'subtitle':
          'Discover movies from every genre, in all\navailable qualities. Find something new\nand exciting to watch every day.'
    },
    {
      'image': 'asset/image/intropage4.png',
      'title': 'Create Watchlists',
      'subtitle':
          'Save movies to your watchlist to keep\ntrack of what you want to watch next.\nEnjoy films in various qualities and\ngenres.'
    },
    {
      'image': 'asset/image/intropage5.png',
      'title': 'Rate, Review, and Learn',
      'subtitle':
          "Share your thoughts on the movies\nyou've watched. Dive deep into film\ndetails and help others discover great\nmovies with your reviews."
    },
    {
      'image': 'asset/image/intropage6.png',
      'title': 'Start Watching Now',
      'subtitle': 'Start Watching Now'
    },
  ];

  void onFirstClick() {
    selectIndex++;
    emit(OnbourdingFirstClick());
  }

  void onNextTap(context) {
    selectIndex++;
    if (selectIndex == contentList.length) {
      selectIndex = contentList.length - 1;
      print('the lenth is ${contentList.length}');
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginPage.id,
        (Route<dynamic> route) => false,
      );
    }

    emit(OnbourdingClickedNext());
  }

  void onBackTap() {
    selectIndex--;
    if (selectIndex == 0) {
      selectIndex = 0;
    }

    emit(OnbourdingClickedBack());
  }
}
