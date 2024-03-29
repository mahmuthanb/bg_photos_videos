// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:bg_photos_videos/app/data/model/image_model.dart';
import 'package:bg_photos_videos/app/data/service/api_service.dart';

@injectable
class ImageRepository {
  final ApiService _apiService;
  ImageRepository(this._apiService);

  Future<ImageResponseModel<List<ImageModel>>> fetchImage() async {
    final images = await _apiService.fetchImages();
    return images;
  }

  Future<ImageResponseModel<List<ImageModel>>> searchImage(
    String query, {
    String? orientation,
  }) async {
    final result = await _apiService.searchImages(query, orientation);
    return result;
  }
}
