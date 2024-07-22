import 'package:book/repositories/blocs/my_book/my_book_bloc.dart';
import 'package:book/screens/home/children/background_gradient_widget.dart';
import 'package:book/screens/home/children/bottom_navigation_bar.dart';
import 'package:book/screens/home/children/home_page_screen.dart';
import 'package:book/screens/home/children/my_book_screen.dart';
import 'package:book/screens/home/children/profile_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/blocs/my_book/my_book_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MyBookBloc>().add(LoadListBook(page: 1));
  }

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
              MyBookScreen(),
              const ProfilePageScreen(),
            ]),
      ),
      bottomNavigationBar: BottomNavBar(
        pageController: pageController,
      ),
    );
  }
}
