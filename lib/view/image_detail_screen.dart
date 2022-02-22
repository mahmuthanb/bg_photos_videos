import 'dart:ui';

import 'package:bg_photos_videos/constants/style_guide.dart';
import 'package:bg_photos_videos/data/model/image_model.dart';
import 'package:bg_photos_videos/view/widgets/custom_cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail(
    this.image, {
    Key? key,
  }) : super(key: key);

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(image.alt),
        // leadingWidth: ,
        toolbarHeight: kToolbarHeight,
        leadingWidth: kToolbarHeight,
        backgroundColor: Colors.white,
        titleTextStyle: ThemeData().textTheme.headline6,
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Scaffold.of(context).openDrawer();
                  Navigator.pop(context);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: image.src["original"]!,
            fit: BoxFit.cover,
          ),
          Container(
            height: size.height * .06,
            child: Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: image.src.length,
                itemBuilder: (context, index) {
                  String avgColor = image.avgColor.replaceAll("#", "");
                  return GestureDetector(
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              // title: const Text("Image Box"),
                              insetPadding: EdgeInsets.zero,
                              contentPadding: EdgeInsets.zero,
                              content: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 4.0,
                                  sigmaY: 4.0,
                                ),
                                child: Container(
                                  width: size.width * .75,
                                  height: size.height * .75,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: PhotoView(
                                      imageProvider: CachedNetworkImageProvider(
                                        image.src.values.elementAt(index),
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                        }),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kGlobalRadius),
                        color: Color(int.parse("0xFF$avgColor")),
                      ),
                      margin: index == 0
                          ? const EdgeInsets.only(
                              left: kMobilePadding / 2,
                              right: kMobilePadding / 2)
                          : const EdgeInsets.only(right: kMobilePadding / 2),
                      padding: const EdgeInsets.all(kMobilePadding / 2),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // CustomCachedNetworkImage(
                          //   image.src.values.elementAt(index),
                          //   width: size.width * .3,
                          //   height: size.height * .2,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                image.src.keys.elementAt(index),
                                style: ThemeData().textTheme.headline4,
                              ),
                              const Icon(
                                Icons.download,
                                size: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
