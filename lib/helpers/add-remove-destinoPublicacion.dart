class ChagendDestinoPublicacion {
  List<int> addDestinoPublicacion(int idPersonaDestino, List<int> paraQuienes) {
    List<int> modifiableList = [...paraQuienes];
    modifiableList.add(idPersonaDestino);
    return modifiableList;
  }

  List<int> removeDestinoPublicacion(
      int idPersonaDestino, List<int> paraQuienes) {
    List<int> modifiableList = [...paraQuienes];
    modifiableList.remove(idPersonaDestino);
    return modifiableList;
  }
}
