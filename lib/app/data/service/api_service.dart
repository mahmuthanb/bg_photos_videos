import 'package:bg_photos_videos/app/data/model/image_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part "api_service.g.dart";

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/v1/curated")
  Future<List<ImageModel>> fetchImages();
}
