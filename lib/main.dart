import 'package:bg_photos_videos/view/home_screen.dart';
import 'package:bg_photos_videos/view/photos_screen.dart';
import 'package:bg_photos_videos/view/profile_screen.dart';
import 'package:bg_photos_videos/view/search_screen.dart';
import 'package:bg_photos_videos/view/videos_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/style_guide.dart';

void main() {
  runApp(const BgPhotosVideos());
}

final PageController _controller = PageController();
int selectedPage = 0;

class BgPhotosVideos extends StatefulWidget {
  const BgPhotosVideos({Key? key}) : super(key: key);

  @override
  State<BgPhotosVideos> createState() => _BgPhotosVideosState();
}

class _BgPhotosVideosState extends State<BgPhotosVideos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BG Photo & Video Provider',
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      themeMode: ThemeMode.light,
      darkTheme: customDarkTheme,
      home: Scaffold(
        body: SafeArea(
          child: PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomePage(),
              PhotosScreen(),
              VideosScreen(),
              ProfileScreen(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (BuildContext ctx) => const SearchScreen())),
          child: const Icon(
            Icons.search,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          unselectedItemColor: Colors.grey.shade600,
          selectedItemColor: Colors.grey.shade400,
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedPage,
          selectedIconTheme: const IconThemeData(size: 25),
          unselectedIconTheme: const IconThemeData(size: 20),
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            pageChange(index);
            setState(() {
              selectedPage = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.photo), label: "Photo"),
            BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: "Video"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

pageChange(int page) {
  _controller.jumpToPage(page);
}
