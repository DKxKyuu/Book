import 'package:book/core/themes/app_constant.dart';
import 'package:book/repositories/blocs/chapter/chapter_bloc.dart';
import 'package:book/repositories/blocs/chapter/chapter_event.dart';
import 'package:book/repositories/blocs/chapter/chapter_state.dart';
import 'package:book/screens/content_chapter/children/button_bottom_widget.dart';
import 'package:book/screens/home/children/background_gradient_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../repositories/customer_widget/image_customer.dart';
import 'children/app_bar_content_chapter_widget.dart';

class ContentChapterScreen extends StatefulWidget {
  ContentChapterScreen(
      {super.key, required this.urlChapters, required this.index});
  List<String> urlChapters;

  int index;

  @override
  State<ContentChapterScreen> createState() => _ContentChapterScreenState();
}

class _ContentChapterScreenState extends State<ContentChapterScreen> {
  List<String> imagesURL = [
    'https://sv1.otruyencdn.com/uploads/20240505/e4733d5a636948d337bed35f04cb6d1b/chapter_12/page_13.jpg',
    'https://sv1.otruyencdn.com/uploads/20240505/e4733d5a636948d337bed35f04cb6d1b/chapter_12/page_14.jpg',
    'https://sv1.otruyencdn.com/uploads/20240505/e4733d5a636948d337bed35f04cb6d1b/chapter_12/page_15.jpg',
    'https://sv1.otruyencdn.com/uploads/20240505/e4733d5a636948d337bed35f04cb6d1b/chapter_12/page_16.jpg',
    'https://sv1.otruyencdn.com/uploads/20240505/e4733d5a636948d337bed35f04cb6d1b/chapter_12/page_17.jpg',
    'https://sv1.otruyencdn.com/uploads/20240505/e4733d5a636948d337bed35f04cb6d1b/chapter_12/page_18.jpg',
  ];

  @override
  void initState() {
    super.initState();
    context
        .read<ContentBloc>()
        .add(LoadMoreData(urlChapter: widget.urlChapters[widget.index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  AppBarContentChapterWidget(
                    index: widget.index,
                  ),
                  // const Text(
                  //   '',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  Expanded(child: BlocBuilder<ContentBloc, ContentState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return Skeletonizer(
                          child: ListView.builder(
                            itemCount: imagesURL.length,
                            itemBuilder: (context, index) {
                              return CustomImage2(
                                url: imagesURL[index],
                                height: 500,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: state.pathUrls.length,
                        itemBuilder: (context, index) {
                          return CustomImage2(
                            url: state.pathUrls[index],
                            height: 500,
                            fit: BoxFit.cover,
                          );
                        },
                      );
                    },
                  ))
                ],
              )),
              ButtonBottomWidget(
                index: widget.index,
                urlChapters: widget.urlChapters,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
