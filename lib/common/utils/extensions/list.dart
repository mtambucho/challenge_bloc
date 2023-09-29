extension ListHelper<T> on List<T> {
  ///return first element of list if not null
  T? get safeFirst {
    if (isNotEmpty) {
      return first;
    }
    return null;
  }
}
