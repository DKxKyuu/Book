import 'package:book/core/themes/app_constant.dart';
import 'package:book/repositories/blocs/detail_book/detail_book_bloc.dart';
import 'package:book/repositories/blocs/detail_book/detail_book_state.dart';
import 'package:book/repositories/models/book_detail_model.dart';
import 'package:book/repositories/models/book_model.dart';
import 'package:book/screens/detail_book/children/appbar_detail_book_widget.dart';
import 'package:book/screens/detail_book/children/button_reading_widget.dart';
import 'package:book/screens/detail_book/children/category_book_widget.dart';
import 'package:book/screens/detail_book/children/shortcut_book_widegt.dart';
import 'package:book/screens/home/children/background_gradient_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailBookScreen extends StatelessWidget {
  DetailBookScreen({super.key, required this.model});
  BookModel model;
  BookDetailModel modelDetail = BookDetailModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: BlocBuilder<DetailBookBloc, DetailBookState>(
        builder: (context, state) {
          if (state.isLoading) {
            return SafeArea(
                child: Skeletonizer(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.padding),
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppbarDetailBookWidget(
                                    title: "No data",
                                  ),
                                  ShortcutBookWidegt(
                                    model: model,
                                    modelDetail: null,
                                  ),
                                  CategoryBookWidget(
                                    categories: ['ádhaksjd', 'ahsdladsl'],
                                    quanityChapters: '4',
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 15),
                                            child: const Text(
                                              "Overview",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              child: Text(
                                                model.thumbNailURL ??
                                                    "Null data",
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing: 1.2,
                                                    wordSpacing: 1.4,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            ButtonReadingWidget(
                              model: modelDetail,
                            ),
                          ],
                        ))));
          }

          if (state.book != null) {
            modelDetail = state.book!;
          }
          return SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.padding),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppbarDetailBookWidget(
                              title: model.nameBook ?? "No data",
                            ),
                            ShortcutBookWidegt(
                              model: model,
                              modelDetail: modelDetail,
                            ),
                            CategoryBookWidget(
                              categories: modelDetail.catogories,
                              quanityChapters: '${modelDetail.quanityChapters}',
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 15),
                                      child: const Text(
                                        "Overview",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Text(
                                          modelDetail.descriptionHead,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 1.2,
                                              wordSpacing: 1.4,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      ButtonReadingWidget(
                        model: modelDetail,
                      ),
                    ],
                  )));
        },
      )),
    );
  }
}
