import 'package:bg_photos_videos/constants/style_guide.dart';
import 'package:bg_photos_videos/search/cubit/search_cubit.dart';
import 'package:bg_photos_videos/shared/view/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    this.focused = false,
    this.requestFocus,
    Key? key,
  }) : super(key: key);
  final bool? focused;
  final bool? requestFocus;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
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
                        child: SearchBar(requestFocus: requestFocus),
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
        } else if (state is SearchLoading) {
          return const Center(child: Text("state is loading"));
        } else if (state is SearchFailed) {
          return const Center(child: Text("state is failed")); // FAILED STATE
        } else {
          return const Center(
              child: Text("state is loaded")); // LOADED W/O PROBLEM STATE
        }
      },
    );
  }
}
