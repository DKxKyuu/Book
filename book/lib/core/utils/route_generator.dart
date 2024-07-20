import 'package:book/core/utils/navigator_names.dart';
import 'package:book/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    switch (settings.name) {
      case NavigatorNames.HOME:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(), fullscreenDialog: true);
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
