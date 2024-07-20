import 'package:book/core/themes/app_constant.dart';

class BookModel {
  String? idBook;
  String? nameBook;
  String? author;
  String? titleOverview;

  BookModel(
      {required this.author,
      required this.idBook,
      required this.nameBook,
      required this.titleOverview});

  static List<BookModel> skeletonTemplate() {
    return [
      BookModel(
          author: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 1',
          titleOverview: AppConstants.stringOverviewExample),
      BookModel(
          author: 'Author 2',
          idBook: 'idBook_2',
          nameBook: 'nameBook 2',
          titleOverview: AppConstants.stringOverviewExample),
      BookModel(
          author: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 3',
          titleOverview: AppConstants.stringOverviewExample),
      BookModel(
          author: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 4',
          titleOverview: AppConstants.stringOverviewExample),
      BookModel(
          author: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 5',
          titleOverview: AppConstants.stringOverviewExample),
      BookModel(
          author: 'Author 2',
          idBook: 'idBook_2',
          nameBook: 'nameBook 6',
          titleOverview: AppConstants.stringOverviewExample),
      BookModel(
          author: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 7',
          titleOverview: AppConstants.stringOverviewExample),
      BookModel(
          author: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 8',
          titleOverview: AppConstants.stringOverviewExample),
      BookModel(
          author: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 9',
          titleOverview: AppConstants.stringOverviewExample),
      BookModel(
          author: 'Author 2',
          idBook: 'idBook_2',
          nameBook: 'nameBook 10',
          titleOverview: AppConstants.stringOverviewExample),
      BookModel(
          author: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 11',
          titleOverview: AppConstants.stringOverviewExample),
      BookModel(
          author: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 12',
          titleOverview: AppConstants.stringOverviewExample),
    ];
  }
}
