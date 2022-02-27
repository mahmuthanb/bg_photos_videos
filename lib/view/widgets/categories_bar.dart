import 'package:bg_photos_videos/constants/style_guide.dart';
import 'package:flutter/material.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMobilePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CategoryListingItem("Hot", Icon(Icons.new_label_outlined)),
          CategoryListingItem("Category", Icon(Icons.category)),
          CategoryListingItem(
              "Top Charts", Icon(Icons.format_list_numbered_rtl_outlined)),
          CategoryListingItem("Selected", Icon(Icons.select_all)),
          CategoryListingItem("News", Icon(Icons.newspaper)),
        ],
      ),
    );
  }
}

class CategoryListingItem extends StatelessWidget {
  const CategoryListingItem(this.title, this.icon, {Key? key})
      : super(key: key);

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .06,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          Text(title),
        ],
      ),
    );
  }
}
