import 'package:book/core/utils/navigator_names.dart';
import 'package:book/screens/detail_book/detail_book_screen.dart';
import 'package:book/screens/home/home_screen.dart';
import 'package:book/screens/list_chapters/list_chapters_screen.dart';
import 'package:flutter/material.dart';

import '../../screens/content_chapter/content_chapter_screen.dart';

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
      case NavigatorNames.CONTENT_CHAPTER:
        return MaterialPageRoute(
            builder: (_) => ContentChapterScreen(
                  urlChapters: args?['list'],
                  index: args?['currentIndex'],
                ),
            fullscreenDialog: true);

      case NavigatorNames.LIST_CHAPTERS:
        return MaterialPageRoute(
            builder: (_) => ListChaptersScreen(
                  model: args?['BookModelDetail'],
                ),
            fullscreenDialog: true);
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
