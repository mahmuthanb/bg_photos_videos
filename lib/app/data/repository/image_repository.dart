import 'package:bg_photos_videos/core/data/model/image_model.dart';
import 'package:bg_photos_videos/core/data/service/network.dart';

class ImageRepository {
  final NetworkService networkService;

  ImageRepository({required this.networkService});

  Future<List<ImageModel>> fetchImage() async {
    final images = await networkService.fetchImages();
    return images;
  }

  Future<List<ImageModel>> searchImage(String query,
      {String? orientation}) async {
    final searchResult = await networkService.searchImages(query, orientation);
    return searchResult;
  }
}
