import '../../models/book_model.dart';

class MyBookState {
  bool isLoading;
  List<BookModel> books;

  MyBookState({this.books = const [], this.isLoading = false});

  MyBookState copyWith({bool? isLoading, List<BookModel>? books}) {
    return MyBookState(
        isLoading: isLoading ?? this.isLoading, books: books ?? this.books);
  }
}
