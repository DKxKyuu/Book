abstract class DetailBookEvent {}

class LoadDataFormUser extends DetailBookEvent {
  String slug;
  LoadDataFormUser({required this.slug});
}
