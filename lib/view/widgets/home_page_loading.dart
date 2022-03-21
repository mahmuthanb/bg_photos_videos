import 'package:bg_photos_videos/constants/style_guide.dart';
import 'package:bg_photos_videos/view/widgets/categories_bar.dart';
import 'package:flutter/material.dart';

class HomePageLoading extends StatelessWidget {
  const HomePageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          // color: Colors.red,
          width: size.width,
          padding: const EdgeInsets.all(kMobilePadding),
          child: TextFormField(
            enabled: false,
            // controller: searchController,
            // decoration: InputDecoration(
            // prefixIcon: const Icon(Icons.search),
            // hintText: "nature, wolf, cat, puppy, kitten...",
            // hintStyle: Theme.of(context).textTheme.bodyText1,
            // ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: kMobilePadding),
          width: size.width,
          height: size.height * .25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey.shade200,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(kMobilePadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CategoryItemPlaceholder(),
              CategoryItemPlaceholder(),
              CategoryItemPlaceholder(),
              CategoryItemPlaceholder(),
              CategoryItemPlaceholder(),
              CategoryItemPlaceholder(),
            ],
          ),
        )
      ],
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.grey.shade200,
            ),
          ),
          Container(
            width: size.width * .075,
            height: size.width * .025,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.grey.shade200,
            ),
          ),
        ],
      ),
    );
  }
}
