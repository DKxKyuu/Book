import 'package:book/core/themes/app_color.dart';
import 'package:book/core/utils/route_generator.dart';
import 'package:book/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        primaryColor: AppColors.white,
        indicatorColor: AppColors.white,
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: false,
      ),
      home: const HomeScreen(), 
    );
  }
}
