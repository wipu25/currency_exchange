class StateHelper {
  static List<T> removeAt<T>(List<T> list, int position) {
    final newList = List<T>.from(list);
    newList.removeAt(position);
    return newList;
  }
}
