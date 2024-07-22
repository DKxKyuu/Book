import 'package:book/core/themes/app_color.dart';
import 'package:book/core/utils/https_client.dart';
import 'package:book/core/utils/route_generator.dart';
import 'package:book/repositories/blocs/my_book/my_book_bloc.dart';
import 'package:book/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/blocs/chapter/chapter_bloc.dart';
import 'repositories/blocs/detail_book/detail_book_bloc.dart';

void main() async {
  FetchClient service = FetchClient();
  // final response = await service.getData(   // danh sách truyện
  //     domainApp: 'https://otruyenapi.com/v1/api/',
  //     path: 'danh-sach/truyen-moi?page=1');
  // final response = await service.getData(
  //     // detail 1 truyện.
  //     domainApp: 'https://otruyenapi.com/v1/api/',
  //     path:
  //         'truyen-tranh/yuusha-to-yobareta-nochi-ni-soshite-musou-otoko-wa-kazoku-wo-tsukuru');
  // final response = await service.getData( // lấy được truyện.
  //     domainApp: 'https://sv1.otruyencdn.com/v1/api/',
  //     path: 'chapter/663740968d19104b9c761297');
//

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MyBookBloc>(create: (context) => MyBookBloc()),
          BlocProvider<DetailBookBloc>(create: (context) => DetailBookBloc()),
          BlocProvider<ContentBloc>(create: (context) => ContentBloc()),
        ],
        child: MaterialApp(
          title: 'Book',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.generateRoute,
          theme: ThemeData(
            primaryColor: AppColors.white,
            indicatorColor: AppColors.white,
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 255, 255, 255)),
            useMaterial3: false,
          ),
          home: const HomeScreen(),
        ));
  }
}
