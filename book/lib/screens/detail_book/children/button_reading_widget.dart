import 'package:book/repositories/models/book_model.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/app_color.dart';
import '../../../core/utils/navigator_names.dart';

class ButtonReadingWidget extends StatelessWidget {
  ButtonReadingWidget({super.key, required this.model});
  BookModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.button,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 42),
          ),
          onPressed: () {
            Navigator.pushNamed(context, NavigatorNames.LIST_CHAPTERS,
                arguments: {'BookModel': model});
          },
          child: const Text(
            "Đọc sách",
            style: TextStyle(fontSize: 13),
          )),
    );
  }
}
