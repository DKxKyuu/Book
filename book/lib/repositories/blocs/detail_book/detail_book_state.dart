import 'package:book/repositories/models/book_detail_model.dart';

class DetailBookState {
  bool isLoading;
  BookDetailModel? book;

  DetailBookState({this.isLoading = true, this.book});

  DetailBookState copyWith({bool? isLoading, BookDetailModel? book}) {
    return DetailBookState(
        book: book ?? this.book, isLoading: isLoading ?? this.isLoading);
  }
}

