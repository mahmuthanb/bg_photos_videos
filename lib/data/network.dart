import 'dart:convert';
import 'package:bg_photos_videos/data/api_provider.dart';
import 'package:bg_photos_videos/data/model/image_model.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  final String baseUrl = 'api.pexels.com';
  final String photoUrl = '/v1';
  final String videoUrl = '/videos';

  final Map<String, String> queryParameters = {
    "Authorization": pexelsAPI,
  };
  Future<List<ImageModel>> fetchImages() async {
    try {
      final uri = Uri.https(baseUrl, photoUrl + '/curated');
      final response = await http.get(uri, headers: queryParameters);
      if (response.statusCode == 200) {
        var decodedResponse = ImageResponseModel.fromJson(jsonDecode(response.body));

        return decodedResponse.photos;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      Exception(e);
      return [];
    }
  }
}
