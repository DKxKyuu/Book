import 'package:book/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final PageController pageController;
  BottomNavBar({required this.pageController});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      decoration: const BoxDecoration(
          color: AppColors.bottomNavBar,
          border:
              Border(top: BorderSide(color: AppColors.bottomNavBar, width: 1))),
      child: BottomNavigationBar(
          backgroundColor: AppColors.bottomNavBar,
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.iconBottomNavBar,
          elevation: 0,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  size: 24,
                ),
                activeIcon: Icon(
                  Icons.home_filled,
                  size: 24,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_book_rounded,
                  size: 24,
                ),
                activeIcon: Icon(
                  Icons.menu_book_rounded,
                  size: 24,
                ),
                label: 'My book'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 24,
                ),
                activeIcon: Icon(
                  Icons.account_circle_outlined,
                  size: 24,
                ),
                label: 'Profile'),
          ],
          onTap: (int index) async {
            setState(() {
              this.index = index;
              widget.pageController.jumpToPage(index);
            });
          }),
    );
  }
}
