// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bg_photos_videos/app/page/home/cubit/home_cubit.dart';
import 'package:bg_photos_videos/core/widget/carousel_slider.dart';
import 'package:bg_photos_videos/core/widget/error_screen.dart';
import 'package:bg_photos_videos/core/widget/home_page_loading.dart';
import 'package:bg_photos_videos/core/widget/portrait_carousel_title.dart';
import 'package:bg_photos_videos/core/widget/searchbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const HomePageLoading();
        } else if (state is HomeLoaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomSearchBar(enabled: false, requestFocus: true),
                  CarouselSliderArea(state.images[0]),
                  PortraitCarouselTitle("Nature", state.images[1]),
                  PortraitCarouselTitle("Deutschland", state.images[2]),
                  PortraitCarouselTitle("Netherlands", state.images[3]),
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
