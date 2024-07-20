import 'package:flutter/material.dart';

import '../../../core/themes/app_color.dart';

class AppbarDetailBookWidget extends StatelessWidget {
  AppbarDetailBookWidget({super.key, required this.title}); 
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
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
          Text(
            title,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.primary),
          ),
          const SizedBox(
            width: 25,
            height: 25,
            child: Icon(
              Icons.save,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
