import 'package:bg_photos_videos/constants/style_guide.dart';
import 'package:bg_photos_videos/view/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, this.enabled, this.width, this.searchController}) : super(key: key);
  final bool? enabled;
  final double? width;
  final TextEditingController? searchController;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController = TextEditingController();
    if (searchController != null) {
      _textEditingController.text = searchController!.text;
    }
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (BuildContext ctx) => const SearchScreen())),
      child: Container(
        // color: Colors.red,
        width: width ?? size.width,
        padding: const EdgeInsets.all(kMobilePadding),
        child: TextFormField(
          enabled: enabled,
          controller: searchController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: "nature, wolf, cat, puppy, kitten...",
            hintStyle: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
