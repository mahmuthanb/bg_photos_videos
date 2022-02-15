import 'dart:convert';
import 'package:bg_photos_videos/data/model/image_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  final String baseUrl = 'api.pexels.com';
  final String photoUrl = '/v1';
  final String videoUrl = '/videos';

  final Map<String, String> queryParameters = {
    "Authorization": "563492ad6f917000010000017f727649c22a48f09fe2f382fb19c7a9",
  };
  Future<List<ImageModel>> fetchImages() async {
    try {
      final uri = Uri.https(baseUrl, photoUrl + '/curated');
      final response = await http.get(uri, headers: queryParameters);
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);

        final decodedPhotos = decodedResponse["photos"];
        return decodedPhotos;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      Exception(e);
      return [];
    }
  }
}
