import 'package:book/repositories/blocs/chapter/chapter_bloc.dart';
import 'package:book/repositories/blocs/chapter/chapter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/themes/app_color.dart';

class ButtonBottomWidget extends StatelessWidget {
  ButtonBottomWidget(
      {super.key, required this.index, required this.urlChapters});

  List<String> urlChapters;

  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                --index;
                if (index < 0) {
                  index = 0;
                }
                context
                    .read<ContentBloc>()
                    .add(LoadMoreData(urlChapter: urlChapters[index]));
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.button),
              child: const Text(
                'Chương trước',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                ++index;
                if (index == urlChapters.length) {
                  index = urlChapters.length - 1;
                }
                context
                    .read<ContentBloc>()
                    .add(LoadMoreData(urlChapter: urlChapters[index]));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.button,
              ),
              child: const Text(
                'Chương kế',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
