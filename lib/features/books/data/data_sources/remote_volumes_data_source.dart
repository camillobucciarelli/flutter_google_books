import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../entities/volumes_response.dart';
import 'volume_data_source.dart';

part 'remote_volumes_data_source.g.dart';

@LazySingleton(as: VolumesDataSource)
@RestApi(baseUrl: 'https://www.googleapis.com/books/v1')
abstract class RemoteVolumesDataSource implements VolumesDataSource {
  @factoryMethod
  factory RemoteVolumesDataSource(@Named('unauthenticated') Dio dio) =
      _RemoteVolumesDataSource;

  // @override
  // Future<VolumesResponse> getVolumes(String query) async {
  //   final response = await _httpClient.get<Map<String, dynamic>>(
  //     'https://www.googleapis.com/books/v1/volumes?q=$query',
  //   );
  //   if (response.statusCode != 200 || response.data == null) {
  //     throw Exception('Something went wrong');
  //   }
  //   return VolumesResponse.fromJson(response.data!);
  // }

  @override
  @GET('/volumes')
  Future<VolumesResponse> getVolumes(
    @Query('q') String query,
    @Query('maxResults') int maxResults,
    @Query('startIndex') int startIndex,
  );
}
