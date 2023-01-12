import 'package:bg_photos_videos/app/data/model/image_model.dart';
import 'package:bg_photos_videos/constants/style_guide.dart';
import 'package:bg_photos_videos/core/widget/custom_cached_network_image.dart';
import 'package:bg_photos_videos/core/widget/custom_webview.dart';
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
      backgroundColor:
          Color(int.parse("0xFF${image.avgColor.replaceAll("#", "")}")),
      appBar: AppBar(
        title: Text(
          image.alt,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        toolbarHeight: kToolbarHeight,
        leadingWidth: kToolbarHeight,
        backgroundColor:
            Color(int.parse("0xFF${image.avgColor.replaceAll("#", "")}")),
        titleTextStyle:
            ThemeData().textTheme.headline6!.copyWith(color: Colors.white70),
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.all(8),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white70,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: image.src["large2x"]!,
                  fit: BoxFit.cover,
                  placeholder: (BuildContext context, String link) {
                    return Container(
                      width: size.width,
                      // height: size.height * .1,
                      color: Color(int.parse(
                          "0xFF${image.avgColor.replaceAll("#", "")}")),
                    );
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: kMobilePadding / 2),
                height: size.height * .05,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: image.src.length,
                  itemBuilder: (context, index) {
                    // Optional Image Buttons
                    String avgColor = image.avgColor.replaceAll("#", "");
                    return GestureDetector(
                      onTap: () => showModalBottomSheet(
                        context: context,
                        barrierColor: Colors.black87,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(size.width * .025),
                          ),
                        ),
                        builder: (context) => Container(
                          height: size.height * .8,
                          // color: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              // vertical: size.height * .075,
                              ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(size.width * .025),
                                child: Stack(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    children: [
                                      CustomCachedNetworkImage(
                                        image.src.values.elementAt(index),
                                        width: size.width,
                                        height: size.height * .6,
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.all(size.height * .01),
                                        child: Text(
                                          image.src.keys
                                              .elementAt(index)
                                              .toUpperCase(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                              const Text("ABOUT PHOTOGRAPHER"),
                              Divider(
                                height: size.height * .025,
                                color: Color(int.parse(
                                    "0xFF${image.avgColor.replaceAll("#", "")}")),
                                indent: size.width * .1,
                                endIndent: size.width * .1,
                                thickness: 1,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            InAppWebview(
                                              image.photographerUrl,
                                              Color(int.parse(
                                                  "0xFF${image.avgColor.replaceAll("#", "")}")),
                                            ))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      // color: Colors.red,
                                      width: size.width * .2,
                                      child: Icon(
                                        Icons.photo_camera_front_rounded,
                                        size: 50,
                                        color: Color(int.parse(
                                            "0xFF${image.avgColor.replaceAll("#", "")}")),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .7,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(image.photographer),
                                          Text(image.photographerUrl,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis),
                                          // Text(image.photographerId.toString()),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         insetPadding: EdgeInsets.zero,
                      //         contentPadding: EdgeInsets.zero,
                      //         content: BackdropFilter(
                      //           filter: ImageFilter.blur(
                      //             sigmaX: 4.0,
                      //             sigmaY: 4.0,
                      //           ),
                      //           child: SizedBox(
                      //             width: size.width * .75,
                      //             // height: size.height * .75,
                      //             child: GestureDetector(
                      //               onTap: () {
                      //                 Navigator.of(context, rootNavigator: true)
                      //                     .pop();
                      //                 // Navigator.pop(context);
                      //               },
                      //               child: PhotoView(
                      //                 imageProvider: CachedNetworkImageProvider(
                      //                   image.src.values.elementAt(index),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     }),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kGlobalRadius),
                          color: Color(int.parse("0xFF$avgColor")),
                        ),
                        margin: index == 0
                            ? const EdgeInsets.only(
                                left: kMobilePadding / 2,
                                right: kMobilePadding / 2,
                              )
                            : const EdgeInsets.only(right: kMobilePadding / 2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: kMobilePadding / 2),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // CustomCachedNetworkImage(
                            //   image.src.values.elementAt(index),
                            //   width: size.width * .3,
                            //   height: size.height * .2,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Icon(
                                  Icons.download,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                Text(
                                  image.src.keys.elementAt(index),
                                  style: ThemeData()
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: size.width,
                color: Color(
                    int.parse("0xFF${image.avgColor.replaceAll("#", "")}")),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => InAppWebview(
                                image.photographerUrl,
                                Color(int.parse(
                                    "0xFF${image.avgColor.replaceAll("#", "")}")),
                              ))),
                  child: Container(
                    // width: size.width * .24,
                    // color: Colors.black,
                    margin: const EdgeInsets.all(kMobilePadding / 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.photo_camera_front_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(
                            image.photographer,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
