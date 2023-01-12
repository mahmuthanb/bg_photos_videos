import 'dart:convert';
// import 'package:bg_photos_videos/data/api_provider.dart';
import 'package:bg_photos_videos/core/data/model/image_model.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  final String baseUrl = 'api.pexels.com';
  final String photoUrl = '/v1';
  final String videoUrl = '/videos';

  final Map<String, String> queryParameters = {"Authorization": pexelsApi};
  Future<List<ImageModel>> fetchImages() async {
    List<ImageModel> responseList = [];
    final uri = Uri.https(baseUrl, '$photoUrl/curated');
    final response = await http.get(uri, headers: queryParameters);
    if (response.statusCode == 200) {
      var decodedResponse =
          ImageResponseModel.fromJson(jsonDecode(response.body));
      responseList = decodedResponse.photos;
      // return response;
      return responseList;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<ImageModel>> searchImages(
      String query, String? orientation) async {
    List<ImageModel> responseList = [];
    final uri = Uri.https(baseUrl, '$photoUrl/search', {
      "query": query.trim(),
      if (orientation != null) "orientation": orientation
    });
    final response = await http.get(uri, headers: queryParameters);
    if (response.statusCode == 200) {
      var decodedResponse =
          ImageResponseModel.fromJson(jsonDecode(response.body));
      responseList = decodedResponse.photos;
      // return response;
      return responseList;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
