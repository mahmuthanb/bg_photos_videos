// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import 'package:bg_photos_videos/app/data/model/image_model.dart';
import 'package:bg_photos_videos/app/page/image_detail/view/image_detail_page.dart';
import 'package:bg_photos_videos/core/resources/style_guide.dart';
import 'package:bg_photos_videos/core/widget/animated_dialog.dart';
import 'package:bg_photos_videos/core/widget/custom_cached_network_image.dart';

class PortraitCarouselTitle extends StatelessWidget {
  const PortraitCarouselTitle(
    this.title,
    this.imageList, {
    Key? key,
  }) : super(key: key);

  final String title;
  final List<ImageModel> imageList;

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
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("MORE >"),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .25,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageList.length,
                itemBuilder: (BuildContext context, int index) {
                  OverlayEntry popUpDialog = OverlayEntry(builder: (build));
                  ImageModel item = imageList[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ImageDetail(item)))),
                    onLongPress: () {
                      popUpDialog = OverlayEntry(
                        builder: ((context) => AnimatedDialog(
                              child: Container(
                                width: size.width * .8,
                                // height: size.height * .45,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(kGlobalRadius)),
                                    color: Colors.white),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: item.src["large"]!,
                                      width: size.width * .8,
                                      height: size.width,
                                      fit: BoxFit.fill,
                                      placeholder: (context, imageSrc) =>
                                          Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.only(
                                            topLeft:
                                                Radius.circular(kGlobalRadius),
                                            topRight:
                                                Radius.circular(kGlobalRadius),
                                          ),
                                        ),
                                        width: size.width * .8,
                                        // height: size.width * .8,
                                      ),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        // width: size.width * .8,
                                        height: size.width * .8,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft:
                                                Radius.circular(kGlobalRadius),
                                            topRight:
                                                Radius.circular(kGlobalRadius),
                                          ),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * .05,
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(Icons.favorite_border),
                                          Icon(Icons.question_answer),
                                          Icon(Icons.more_vert),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      );
                      Overlay.of(context).insert(popUpDialog);
                    },
                    onLongPressEnd: (details) => popUpDialog.remove(),
                    child: Container(
                      padding: index == 0
                          ? const EdgeInsets.only(
                              left: kMobilePadding, right: kMobilePadding)
                          : const EdgeInsets.only(right: kMobilePadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            CustomCachedNetworkImage(
                              item.src["medium"]!,
                              width: size.width * .3,
                              height: size.height * .2,
                            ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: Container(
                                // padding: const EdgeInsets.all(kMobilePadding / 2),
                                alignment: Alignment.center,
                                child: item.liked
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                              ),
                            )
                          ]),
                          SizedBox(
                            height: size.height * .04,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.photographer),
                                SizedBox(
                                  width: size.width * .3,
                                  // color: Colors.red,
                                  child: Text(
                                    item.alt,
                                    maxLines: 1,
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                      color: Colors.yellow.shade900,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
