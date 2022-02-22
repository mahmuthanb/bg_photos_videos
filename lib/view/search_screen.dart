import 'package:bg_photos_videos/constants/style_guide.dart';
import 'package:bg_photos_videos/view/widgets/portrait_carousel_title.dart';
import 'package:bg_photos_videos/view/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<String> imageList = List.generate(
        10,
        (index) =>
            "https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
    //final TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(kGlobalRadius),
                      ),
                      color: Colors.grey.shade200,
                    ),
                    width: size.width * .1,
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      splashRadius: Material.defaultSplashRadius * .75,
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                        color: kPrimaryColor,
                      ),
                    )),
                SizedBox(
                  width: size.width * .875,
                  child: const SearchBar(),
                ),
              ],
            ),
            const Expanded(
              child: Center(
                child: Text(
                  "Couldn't find results. Check out our recommendations below",
                  style: TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // PortraitCarouselTitle("Popular wallpapers", state.images),
            // PortraitCarouselTitle("Popular videos", state.images),
          ],
        ),
      ),
    );
  }
}
