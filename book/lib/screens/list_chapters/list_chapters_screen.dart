import 'package:book/core/themes/app_color.dart';
import 'package:book/core/themes/app_constant.dart';
import 'package:book/core/utils/navigator_names.dart';
import 'package:book/repositories/models/book_model.dart';
import 'package:book/screens/home/children/background_gradient_widget.dart';
import 'package:book/screens/list_chapters/children/app_bar_list_chapters_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListChaptersScreen extends StatelessWidget {
  ListChaptersScreen({super.key, required this.model});

  BookModel model;

  List<String> items = [
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const AppBarListChaptersWidget(),
            const SizedBox(
              height: 28,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, NavigatorNames.DETAIL_BOOK),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 9),
                    height: 55,
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: index % 2 == 0
                            ? const Color.fromARGB(255, 122, 101, 152)
                            : const Color.fromARGB(255, 68, 137, 73)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${index + 1}. ${items[index]}Tiểu tam",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ))),
    );
  }
}
