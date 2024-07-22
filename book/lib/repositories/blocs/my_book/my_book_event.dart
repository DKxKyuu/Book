abstract class MyBookEvent {}

class LoadListBook extends MyBookEvent {
  int page;
  LoadListBook({required this.page});
}
