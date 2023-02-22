import 'package:bg_photos_videos/app/data/model/image_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part "api_service.g.dart";

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  // /captcha2 // şimdilik Kullanılmıyor

  // /api/auth/getKVKKConsent
  // /api/auth/saveKVKKConsent
  // /api/check/checkForFoodStoreButon
  // /api/auth/kvkkHealth
  // /api/auth/getKVKKHealthSurvey
  // /api/auth/saveKVKKHealthSurvey

  @POST("/v1/curated")
  Future<List<ImageModel>> fetchImages(
    @Field() int allowToCommunicate,
    @Field() String deviceId,
    @Field() String emailOrIdentity,
    @Field() String password, {
    @Field() String? phoneNumber,
  });
}
