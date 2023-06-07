// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:bg_photos_videos/app/page/photos/photos.dart';
import 'package:bg_photos_videos/app/page/profile/profile.dart';
import 'package:bg_photos_videos/app/page/unknown.dart';
import 'package:bg_photos_videos/app/page/videos/videos.dart';
import 'package:bg_photos_videos/core/di/locator.dart';
import 'package:bg_photos_videos/core/source/local_data_source.dart';
import 'package:bg_photos_videos/core/widget/no_connectivity.dart';

class RouteModel {
  WidgetBuilder builder;
  bool fullscreenDialog;
  RouteModel({
    required this.builder,
    this.fullscreenDialog = false,
  });
}

@singleton
class AppRoute {
  GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

  final Map<String, RouteModel> _routes = {};
  AppRoute() {
    _routes.addAll(
      {
        "unknown": RouteModel(
          builder: (_) => const UnknownPage(),
        ),
        "/": RouteModel(
          builder: (_) => getIt<LocalDataSource>().isLoggedIn
              ? const ProfileScreen()
              : const PhotosScreen(),
        ),
        "/videos": RouteModel(
          builder: (_) => const VideosScreen(),
        ),
      },
    );
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
        builder:
            _routes[routeSettings.name]?.builder ?? _routes["unknown"]!.builder,
        settings: routeSettings,
        fullscreenDialog:
            _routes[routeSettings.name]?.fullscreenDialog ?? false);
  }

  Widget builder(
    BuildContext context,
    Widget? child,
    bool isConnect,
  ) {
    if (isConnect) {
      return GestureDetector(
        child: child ?? const UnknownPage(),
        onTap: () {
          // TODO IOS ta klavye kapatmak için daha iyi bir yöntem bul.
          FocusManager.instance.primaryFocus?.unfocus();
        },
      );
    } else {
      return Stack(
        children: [child ?? const UnknownPage(), const NoConnectivityPage()],
      );
    }
  }
}
