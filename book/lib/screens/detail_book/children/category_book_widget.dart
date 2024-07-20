import 'package:flutter/material.dart';

class CategoryBookWidget extends StatelessWidget {
  CategoryBookWidget(
      {super.key, required this.categories, required this.quanityChapters});
  String categories;
  String quanityChapters;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 9, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Số chương: $quanityChapters",
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 9),
            child: const Text(
              "Thể loại:",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          Text(
            categories,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
