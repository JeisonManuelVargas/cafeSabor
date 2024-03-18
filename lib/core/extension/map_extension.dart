extension ContextExtension on Map<String, dynamic> {
  Map<String, dynamic> withoutNulls() {
    Map<String, dynamic> newData = Map.from(this);

    List<String> claves = keys.toList();
    for (var clave in claves) {
      if (this[clave] == null || this[clave] == '') {
        newData.remove(clave);
      }
    }
    return newData;
  }
}
