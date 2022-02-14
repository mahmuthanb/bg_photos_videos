import 'package:flutter/material.dart';
import 'package:bg_photos_videos/view/widgets/carousel_slider.dart';
import 'package:bg_photos_videos/view/widgets/categories_bar.dart';
import 'package:bg_photos_videos/view/widgets/portrait_carousel_title.dart';
import 'package:bg_photos_videos/view/widgets/searchbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = List.generate(10, (index) => "https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SearchBar(enabled: false),
            CarouselSliderArea(imageList),
            const CategoriesBar(),
            PortraitCarouselTitle("Newest themes for you", imageList),
            PortraitCarouselTitle("Forest Themes", imageList),
            PortraitCarouselTitle("Selected For You", imageList),
          ],
        ),
      ),
    );
  }
}
