import 'package:bg_photos_videos/core/resources/style_guide.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage(this.url,
      {this.height, required this.width, Key? key})
      : super(key: key);
  final String url;
  final double width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(kGlobalRadius)),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      imageUrl: url,
      placeholder: (BuildContext ctx, String img) {
        return Container(
          width: width,
          height: height ?? width,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(kGlobalRadius)),
          ),
        );
      },
    );
  }
}
