import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
)
class ImageResponseModel<T> {
  int page;
  @JsonKey(name: 'per_page')
  int perPage;
  T? photos;

  ImageResponseModel({
    required this.page,
    required this.perPage,
    required this.photos,
  });

  factory ImageResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ImageResponseModelFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ImageResponseModelToJson(this, toJsonT);
}

@JsonSerializable()
class ImageModel {
  final int id;
  int width;
  int height;
  String url;
  String photographer;
  @JsonKey(name: 'photographer_url')
  String photographerUrl;
  @JsonKey(name: 'photographer_id')
  int photographerId;
  @JsonKey(name: 'avg_color')
  String avgColor;
  Map<String, String> src;
  bool liked;
  String alt;

  ImageModel({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  factory ImageModel.fromJson(Map<String, dynamic> data) =>
      _$ImageModelFromJson(data);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
