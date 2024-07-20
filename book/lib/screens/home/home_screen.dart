import 'package:book/screens/home/childrens/background_gradient_widget.dart';
import 'package:book/screens/home/childrens/bottom_navigation_bar.dart';
import 'package:book/screens/home/childrens/home_page_screen.dart';
import 'package:book/screens/home/childrens/profile_page_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GradientBackground(
        child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              const HomePageScreen(),
              Container(),
              const ProfilePageScreen(),
            ]),
      ),
      bottomNavigationBar: BottomNavBar(
        pageController: pageController,
      ),
    );
  }
}
