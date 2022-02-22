import 'package:bg_photos_videos/constants/style_guide.dart';
import 'package:bg_photos_videos/data/model/image_model.dart';
import 'package:bg_photos_videos/view/widgets/custom_cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderArea extends StatelessWidget {
  const CarouselSliderArea(this.imageList, {Key? key}) : super(key: key);

  final List<ImageModel> imageList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMobilePadding),
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          autoPlay: true,
          viewportFraction: 1,
          enlargeCenterPage: true,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        items: imageList.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return CustomCachedNetworkImage(image.src["medium"]!,
                  width: size.width);
            },
          );
        }).toList(),
      ),
    );
  }
}
