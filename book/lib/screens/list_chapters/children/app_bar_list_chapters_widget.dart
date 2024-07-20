import 'package:book/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class AppBarListChaptersWidget extends StatelessWidget {
  const AppBarListChaptersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 22,
            color: Colors.white,
          ),
        ),
        const Text(
          "Chương truyện",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColors.white),
        ),
        const Icon(
          Icons.more_vert_sharp,
          size: 28,
          color: Colors.white,
        )
      ],
    );
  }
}
