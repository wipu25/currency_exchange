class StateHelper {
  static List<T> removeAt<T>(List<T> list, int position) {
    final newList = List<T>.from(list);
    newList.removeAt(position);
    return newList;
  }

  static List<T> updateAt<T>(List<T> list, int position, T value) {
    final newList = List<T>.from(list);
    newList[position] = value;
    return newList;
  }
}
