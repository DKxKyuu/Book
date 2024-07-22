import 'package:book/core/themes/app_color.dart';
import 'package:book/core/themes/app_constant.dart';
import 'package:book/repositories/blocs/my_book/my_book_bloc.dart';
import 'package:book/repositories/blocs/my_book/my_book_event.dart';
import 'package:book/repositories/blocs/my_book/my_book_state.dart';
import 'package:book/repositories/models/book_model.dart';
import 'package:book/screens/home/children/background_gradient_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/utils/navigator_names.dart';
import '../../../core/utils/route_generator.dart';
import '../../../repositories/blocs/detail_book/detail_book_bloc.dart';
import '../../../repositories/blocs/detail_book/detail_book_event.dart';
import '../../../repositories/customer_widget/image_customer.dart';

class MyBookScreen extends StatefulWidget {
  const MyBookScreen({super.key});

  @override
  State<MyBookScreen> createState() => _MyBookScreenState();
}

class _MyBookScreenState extends State<MyBookScreen> {
  List<BookModel> items = BookModel.skeletonTemplate();
  @override
  void dispose() {
    super.dispose();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 400) {
        loadMore();
      }
    });
  }

  int page = 1;
  bool isLoading = false;

  void loadMore() {
    if (isLoading == false) {
      return;
    }
    print("page: $page");
    isLoading = false;
    context.read<MyBookBloc>().add(LoadListBook(page: ++page));
  }

  final _scrollController = ScrollController();
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
              Expanded(child: BlocBuilder<MyBookBloc, MyBookState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return Skeletonizer(
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
                            }));
                  }
                  if (state.books.isEmpty) {
                    return const Center(
                      child: Text('Null data'),
                    );
                  }

                  items = state.books;
                  return RefreshIndicator(
                    onRefresh: () async =>
                        context.read<MyBookBloc>().add(LoadListBook(page: 1)),
                    child: GridView.builder(
                        padding: const EdgeInsets.all(10),
                        controller: _scrollController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 150 / 258,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          print("Thumbnail ${items[index].thumbNailURL}");
                          return GestureDetector(
                            onTap: () {
                              context.read<DetailBookBloc>().add(
                                  LoadDataFormUser(
                                      slug: items[index].slug ?? ""));
                              Navigator.pushNamed(
                                  context, NavigatorNames.DETAIL_BOOK,
                                  arguments: {'BookModel': items[index]});
                            },
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              width: 150,
                              child: Column(
                                children: [
                                  CustomImage2(
                                    url:
                                        'https://img.otruyenapi.com/uploads/comics/${items[index].thumbNailURL}',
                                    height: 250,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  // Image.asset(
                                  //   "assets/images/image_default.jpg",
                                  //   width: 150,
                                  //   height: 250,
                                  //   fit: BoxFit.cover,
                                  // ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    items[index].nameBook ?? "No data",
                                    textAlign: TextAlign.justify,
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
                        }),
                  );
                },
              )),
            ],
          ),
        ),
      )),
    );
  }
}

/*
 

*/
