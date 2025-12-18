abstract interface class FavoriteVolumeDataSource {
  Future<bool> isFavorite(String id);

  Future<void> addFavorite(String id);

  Future<void> removeFavorite(String id);
}
