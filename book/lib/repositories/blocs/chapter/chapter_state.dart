class ContentState {
  bool isLoading;
  List<String> pathUrls;
  ContentState({this.isLoading = false, this.pathUrls = const []});
  ContentState copyWith({bool? isLoading, List<String>? pathUrls}) {
    return ContentState(
        isLoading: isLoading ?? this.isLoading,
        pathUrls: pathUrls ?? this.pathUrls);
  }
}
