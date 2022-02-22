import 'package:bg_photos_videos/data/model/image_model.dart';
import 'package:bg_photos_videos/data/network.dart';

class ImageRepository {
  final NetworkService networkService;

  ImageRepository({required this.networkService});

  Future<List<ImageModel>> fetchImage() async {
    final images = await networkService.fetchImages();
    return images;
  }
}
