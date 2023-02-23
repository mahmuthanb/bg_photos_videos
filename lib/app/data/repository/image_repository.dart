import 'package:bg_photos_videos/app/data/model/image_model.dart';
import 'package:bg_photos_videos/app/data/service/api_service.dart';

class ImageRepository {
  final ApiService _apiService;

  ImageRepository(this._apiService);

  Future<List<ImageModel>> fetchImage() async {
    final images = await _apiService.fetchImages();
    return images;
  }

  Future<List<ImageModel>> searchImage(
    String query, {
    String? orientation,
  }) async {
    final searchResult = await _apiService.searchImages(query, orientation);
    return searchResult;
  }
}
