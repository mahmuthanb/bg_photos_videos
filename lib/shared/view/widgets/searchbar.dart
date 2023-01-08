import 'package:bg_photos_videos/constants/style_guide.dart';
import 'package:bg_photos_videos/search/view/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.enabled,
    this.width,
    this.requestFocus,
    this.searchController,
  }) : super(key: key);
  final bool? enabled;
  final double? width;
  final bool? requestFocus;
  final TextEditingController? searchController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController textEditingController = TextEditingController();
    FocusNode searchFocusNode = FocusNode();
    if (searchController != null) {
      textEditingController.text = searchController!.text;
    }
    if (requestFocus == true) {
      searchFocusNode.requestFocus();
    }
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (BuildContext ctx) =>
                  SearchScreen(focused: true, requestFocus: requestFocus))),
      child: Container(
        // color: Colors.red,
        width: width ?? size.width,
        padding: const EdgeInsets.all(kMobilePadding),
        child: TextFormField(
          enabled: enabled,
          focusNode: searchFocusNode,
          controller: searchController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: "nature, wolf, cat, puppy, kitten...",
            hintStyle: Theme.of(context).textTheme.bodyText1,
          ),
          onFieldSubmitted: (value) {
            if (value.length > 3) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                value,
              )));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                "Please type 3 or more character to search",
              )));
            }
          },
        ),
      ),
    );
  }
}