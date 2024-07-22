abstract class ContentEvent {}

class LoadMoreData extends ContentEvent {
  String urlChapter;

  LoadMoreData({required this.urlChapter});
}

// class LoadMoreByBtn extends ContentEvent {
//   String urlChapter;

//   LoadMoreByBtn({required this.urlChapter});
// }
