import 'package:bg_photos_videos/constants/style_guide.dart';
import 'package:bg_photos_videos/data/model/image_model.dart';
import 'package:bg_photos_videos/view/image_detail_screen.dart';
import 'package:bg_photos_videos/view/widgets/animated_dialog.dart';
import 'package:bg_photos_videos/view/widgets/custom_cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
      // color: Colors.amber,
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
                  OverlayEntry _popUpDialog = OverlayEntry(builder: (build));
                  ImageModel item = imageList[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ImageDetail(item)))),
                    onLongPress: () {
                      _popUpDialog = OverlayEntry(
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
                                    Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(kGlobalRadius))),
                                      child: CachedNetworkImage(
                                        imageUrl: item.src["large"]!,
                                        width: size.width * .8,
                                        // height: size.height * .4,
                                        fit: BoxFit.fitWidth,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius
                                                    .all(
                                                Radius.circular(kGlobalRadius)),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: size.height * .05,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const [
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
                      Overlay.of(context)?.insert(_popUpDialog);
                    },
                    onLongPressEnd: (details) => _popUpDialog.remove(),
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
                                Container(
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
