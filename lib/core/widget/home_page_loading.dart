// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bg_photos_videos/core/resources/style_guide.dart';

class HomePageLoading extends StatelessWidget {
  const HomePageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Container(
            width: size.width,
            padding: const EdgeInsets.all(kMobilePadding),
            child: TextFormField(
              enabled: false,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: kMobilePadding),
            width: size.width,
            height: size.height * .25,
            decoration: radiusBoxDecoration,
          ),
          Container(
            padding: const EdgeInsets.all(kMobilePadding),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryItemPlaceholder(),
                CategoryItemPlaceholder(),
                CategoryItemPlaceholder(),
                CategoryItemPlaceholder(),
                CategoryItemPlaceholder(),
                CategoryItemPlaceholder(),
              ],
            ),
          ),
          const ImageCarouselPlaceholder(),
          const ImageCarouselPlaceholder(),
        ],
      ),
    );
  }
}

class ImageCarouselPlaceholder extends StatelessWidget {
  const ImageCarouselPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: kMobilePadding),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: kMobilePadding),
            height: size.height * .05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width * .2,
                  height: size.height * .025,
                  decoration: radiusBoxDecoration,
                ),
                Container(
                  width: size.width * .15,
                  height: size.height * .025,
                  decoration: radiusBoxDecoration,
                ),
                // Text("MORE >"),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .25,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      padding: index == 0
                          ? const EdgeInsets.only(
                              left: kMobilePadding, right: kMobilePadding)
                          : const EdgeInsets.only(right: kMobilePadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width * .3,
                            height: size.height * .2,
                            decoration: radiusBoxDecoration,
                          ),
                          SizedBox(
                            height: size.height * .04,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: size.width * .15,
                                  height: size.height * .015,
                                  decoration: radiusBoxDecoration,
                                ),
                                Container(
                                  width: size.width * .3,
                                  height: size.height * .015,
                                  decoration: radiusBoxDecoration,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class CategoryItemPlaceholder extends StatelessWidget {
  const CategoryItemPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .06,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            // color: Colors.black,
            width: size.width * .075,
            height: size.width * .075,
            decoration: radiusBoxDecoration,
          ),
          Container(
              width: size.width * .075,
              height: size.width * .025,
              decoration: radiusBoxDecoration),
        ],
      ),
    );
  }
}
