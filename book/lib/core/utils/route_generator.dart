import 'package:book/core/utils/navigator_names.dart';
import 'package:book/screens/detail_book/detail_book_screen.dart';
import 'package:book/screens/home/home_screen.dart';
import 'package:book/screens/list_chapters/list_chapters_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    switch (settings.name) {
      case NavigatorNames.DETAIL_BOOK:
        return MaterialPageRoute(
            builder: (_) => DetailBookScreen(
                  model: args?['BookModel'],
                ),
            fullscreenDialog: true);
      case NavigatorNames.HOME:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(), fullscreenDialog: true);
      case NavigatorNames.LIST_CHAPTERS:
        return MaterialPageRoute(
            builder: (_) => ListChaptersScreen(
                  model: args?['BookModel'],
                ),
            fullscreenDialog: true);
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
