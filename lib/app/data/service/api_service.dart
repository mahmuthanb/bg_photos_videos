// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import 'package:bg_photos_videos/app/data/model/image_model.dart';

part "api_service.g.dart";

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/v1/curated")
  Future<ImageResponseModel<List<ImageModel>>> fetchImages();

  @GET("/v1/search")
  Future<ImageResponseModel<List<ImageModel>>> searchImages(
    @Query("query") String query,
    @Query("orientation") String? orientation,
  );
}
