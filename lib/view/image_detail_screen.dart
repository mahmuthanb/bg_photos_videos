import 'package:bg_photos_videos/constants/style_guide.dart';
import 'package:bg_photos_videos/data/model/image_model.dart';
import 'package:bg_photos_videos/view/widgets/custom_cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.blurBackground],
              titlePadding:
                  const EdgeInsetsDirectional.only(start: 60, bottom: 16),
              title: Text(
                image.alt,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              background: CachedNetworkImage(
                imageUrl: image.src["original"]!,
                fit: BoxFit.cover,
              ),
              expandedTitleScale: 1.2,
              // collapseMode: CollapseMode.pin,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              // color: Colors.red,
              height: size.height * .95,
              width: size.width,

              margin: const EdgeInsets.symmetric(
                vertical: kMobilePadding / 2,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height * .25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: image.src.length,
                      itemBuilder: (context, index) {
                        String avgColor = image.avgColor.replaceAll("#", "");

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kGlobalRadius),
                            color: Color(int.parse("0xFF$avgColor")),
                          ),
                          margin: index == 0
                              ? const EdgeInsets.only(
                                  left: kMobilePadding / 2,
                                  right: kMobilePadding / 2,
                                )
                              : const EdgeInsets.only(
                                  right: kMobilePadding / 2,
                                ),
                          padding: const EdgeInsets.all(
                            kMobilePadding / 2,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          image.src.keys.elementAt(index) +
                                              " download started")));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomCachedNetworkImage(
                                  image.src.values.elementAt(index),
                                  width: size.width * .3,
                                  height: size.height * .2,
                                ),
                                Container(
                                  height: size.height * .02,
                                  width: size.width * .3,
                                  // color: Colors.cyan,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(image.src.keys.elementAt(index)),
                                      const Icon(
                                        Icons.download,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
