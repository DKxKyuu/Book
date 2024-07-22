import 'package:book/repositories/blocs/chapter/chapter_event.dart';
import 'package:book/repositories/blocs/chapter/chapter_state.dart';
import 'package:book/repositories/book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc() : super(ContentState()) {
    on<LoadMoreData>(_onLoadingDetailBook);
  }

  BookRepository service = BookRepository();

  _onLoadingDetailBook(LoadMoreData event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));

    List<String> urls = await service.getStngUrlImages(event.urlChapter);
    print('ABD ${urls.toString()}');
    emit(state.copyWith(isLoading: false, pathUrls: urls));
  }
}
