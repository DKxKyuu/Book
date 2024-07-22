import 'package:book/repositories/blocs/detail_book/detail_book_event.dart';
import 'package:book/repositories/blocs/detail_book/detail_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../book_repository.dart';
import '../../models/book_detail_model.dart';

class DetailBookBloc extends Bloc<DetailBookEvent, DetailBookState> {
  DetailBookBloc() : super(DetailBookState()) {
    on<LoadDataFormUser>(_onLoadingDetailBook);
  }

  BookRepository service = BookRepository();

  _onLoadingDetailBook(LoadDataFormUser event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));

    BookDetailModel book = await service.getDetailStory(event.slug);
    emit(state.copyWith(isLoading: false, book: book));

    try {} catch (err) {}
  }
}
