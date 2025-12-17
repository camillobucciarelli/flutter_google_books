import 'package:flutter_google_books/features/books/data/entities/volumes_response.dart';

abstract interface class VolumesDataSource {
  Future<VolumesResponse> getVolumes(
    String query,
    int maxResults,
    int startIndex,
  );
}
