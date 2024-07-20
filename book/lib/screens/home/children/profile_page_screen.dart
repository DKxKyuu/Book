import 'package:book/core/themes/app_color.dart';
import 'package:book/screens/home/children/background_gradient_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/app_constant.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GradientBackground(
            child: SafeArea(
      child: ListView(padding: const EdgeInsets.all(23), children: [
        Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 85,
                  width: 85,
                  color: Colors.white70,
                  child: const Center(
                    child: Icon(
                      Icons.grade,
                      size: 80,
                      color: Color.fromARGB(255, 96, 5, 72),
                    ),
                  ),
                ))),
        const SizedBox(height: 5),
        const Center(
            child: Text(
          'Gia Thịnh',
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
        )),
        const SizedBox(height: 5),
        Center(
            child: Text(
          'Khóa 21 • Đại học tin học ngoại ngữ Hồ Chí Minh',
          style: TextStyle(color: Colors.grey[400], fontSize: 13),
        )),
        const SizedBox(height: 25),
        GestureDetector(
            onTap: () {}, child: buildItem(context, 'Đăng xuất', 'icon_logout'))
      ]),
    )));
  }

  Widget buildItem(BuildContext context, String title, String icon) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.iconBottomNavBar,
            borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.only(
            top: AppConstants.padding,
            left: AppConstants.padding,
            bottom: AppConstants.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Stack(alignment: AlignmentDirectional.center, children: [
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(12))),
                  const Icon(
                    Icons.logout,
                    size: 20,
                    color: AppColors.iconBottomNavBar,
                  ),
                ]),
                const SizedBox(width: 16),
                Text(title, style: const TextStyle(color: Colors.white70)),
              ]),
            ),
            IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: const Icon(Icons.navigate_next,
                    color: Colors.white70, size: 24),
                onPressed: () {})
          ],
        ));
  }
}
