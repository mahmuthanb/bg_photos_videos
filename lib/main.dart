import 'package:bg_photos_videos/cubit/home_cubit.dart';
import 'package:bg_photos_videos/cubit/internet_cubit.dart';
import 'package:bg_photos_videos/data/network.dart';
import 'package:bg_photos_videos/view/home_screen.dart';
import 'package:bg_photos_videos/view/photos_screen.dart';
import 'package:bg_photos_videos/view/profile_screen.dart';
import 'package:bg_photos_videos/view/videos_screen.dart';
import 'package:bg_photos_videos/view/widgets/loading_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/style_guide.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
  final Connectivity connectivity = Connectivity();
  final NetworkService networkService = NetworkService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BG Photo & Video Provider',
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      themeMode: ThemeMode.light,
      darkTheme: customDarkTheme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(connectivity: connectivity),
          ),
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(networkService: networkService),
          )
        ],
        child: Scaffold(
          body: BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state is InternetConnected &&
                  state.connectivityResult != ConnectivityResult.none) {
                return Scaffold(
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
                );
              } else if (state is InternetDisconnected) {
                return const Center(child: Text("Disconnected"));
              }
              return const LoadingScreen();
            },
          ),
          // floatingActionButton: Builder(builder: (context) {
          //   return FloatingActionButton(
          //     onPressed: () => Navigator.push(
          //         context,
          //         CupertinoPageRoute(
          //             builder: (BuildContext ctx) => const SearchScreen())),
          //     child: const Icon(
          //       Icons.search,
          //     ),
          //   );
          // }),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerFloat,
          // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          // bottomNavigationBar: BottomNavigationBar(
          //   elevation: 0,
          //   unselectedItemColor: Colors.grey.shade600,
          //   selectedItemColor: Colors.grey.shade400,
          //   backgroundColor: Colors.transparent,
          //   showSelectedLabels: false,
          //   showUnselectedLabels: false,
          //   currentIndex: selectedPage,
          //   selectedIconTheme: const IconThemeData(size: 25),
          //   unselectedIconTheme: const IconThemeData(size: 20),
          //   type: BottomNavigationBarType.fixed,
          //   onTap: (int index) {
          //     _controller.jumpToPage(index);
          //     setState(() {
          //       selectedPage = index;
          //     });
          //   },
          //   items: const [
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          //     BottomNavigationBarItem(icon: Icon(Icons.photo), label: "Photo"),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.video_collection), label: "Vde"),
          //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Prf"),
          //   ],
          // ),
        ),
      ),
    );
  }
}
