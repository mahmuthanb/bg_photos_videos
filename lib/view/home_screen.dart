import 'package:bg_photos_videos/cubit/home_cubit.dart';
import 'package:bg_photos_videos/view/widgets/home_page_loading.dart';
import 'package:flutter/material.dart';
import 'package:bg_photos_videos/view/widgets/carousel_slider.dart';
import 'package:bg_photos_videos/view/widgets/categories_bar.dart';
import 'package:bg_photos_videos/view/widgets/portrait_carousel_title.dart';
import 'package:bg_photos_videos/view/widgets/searchbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/error_screen.dart';
import 'widgets/loading_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading || state is HomeLoaded) {
          return const HomePageLoading();
        } else if (state is HomeLoaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SearchBar(enabled: false),
                  CarouselSliderArea(state.images[0]),
                  const CategoriesBar(),
                  PortraitCarouselTitle(
                      "Newest themes for you", state.images[1]),
                  PortraitCarouselTitle("Forest Themes", state.images[2]),
                  PortraitCarouselTitle("Selected For You", state.images[3]),
                ],
              ),
            ),
          );
        } else if (state is HomeFailed) {
          return ErrorScreen(message: state.message);
        } else {
          return const ErrorScreen();
        }
      },
    );
  }
}
