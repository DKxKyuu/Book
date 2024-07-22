import 'package:book/repositories/blocs/my_book/my_book_event.dart';
import 'package:book/repositories/blocs/my_book/my_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../book_repository.dart';
import '../../models/book_model.dart';

class MyBookBloc extends Bloc<MyBookEvent, MyBookState> {
  MyBookBloc() : super(MyBookState()) {
    on<LoadListBook>(_onLoadingListBook);
  }

  BookRepository service = BookRepository();

  _onLoadingListBook(LoadListBook event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    List<BookModel> books = [];
    books = await service.getPageStory(event.page);
    emit(state.copyWith(isLoading: false, books: books));

    try {} catch (err) {}
  }
}
