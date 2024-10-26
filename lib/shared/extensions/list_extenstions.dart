extension ListExtensions<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
