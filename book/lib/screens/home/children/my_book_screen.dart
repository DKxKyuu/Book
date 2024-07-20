import 'package:book/core/themes/app_color.dart';
import 'package:book/core/themes/app_constant.dart';
import 'package:book/repositories/models/book_model.dart';
import 'package:book/screens/home/children/background_gradient_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/navigator_names.dart';
import '../../../core/utils/route_generator.dart';

class MyBookScreen extends StatelessWidget {
  MyBookScreen({super.key});

  final items = BookModel.skeletonTemplate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 22,
                        color: AppColors.white,
                      ),
                    ),
                    const Text(
                      "Danh sách yêu thích",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary),
                    ),
                    const SizedBox(
                      height: 20,
                      width: 20,
                    )
                  ],
                ),
              ),
              Expanded(
                  child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 150 / 258,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, NavigatorNames.DETAIL_BOOK,
                                arguments: {'BookModel': items[index]});
                          },
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            width: 150,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/image_default.jpg",
                                  width: 150,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  items[index].nameBook ?? "No data",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.white),
                                )
                              ],
                            ),
                          ),
                        );
                      })),
            ],
          ),
        ),
      )),
    );
  }
}
