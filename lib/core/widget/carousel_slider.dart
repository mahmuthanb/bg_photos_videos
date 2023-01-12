import 'package:bg_photos_videos/core/data/model/image_model.dart';
import 'package:bg_photos_videos/core/resources/style_guide.dart';
import 'package:bg_photos_videos/core/widget/custom_cached_network_image.dart';
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
              return SizedBox(
                width: size.width,
                child: Stack(
                  children: [
                    CustomCachedNetworkImage(image.src["medium"]!,
                        width: size.width),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: size.width - 2 * kMobilePadding,
                        height: 100,
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(kGlobalRadius)),
                          gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 5,
                        child: Container(
                          // color: Colors.amber,
                          width: size.width - 2 * kMobilePadding,
                          padding: const EdgeInsets.symmetric(
                              horizontal: kMobilePadding / 2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                // color: Colors.red,
                                width: (size.width - 4 * kMobilePadding) * .35,
                                child: Wrap(children: [
                                  Text(
                                    image.photographer,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: (size.width - 4 * kMobilePadding) * .65,
                                child: Wrap(
                                  alignment: WrapAlignment.end,
                                  children: [
                                    Text(
                                      image.alt,
                                      maxLines: 4,
                                      textAlign: TextAlign.right,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
