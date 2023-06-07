// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:bg_photos_videos/app/data/api_provider.dart';

abstract class AppConfig {
  String get appName;
  String get baseUrl;
  String get apiKey;
}

@Environment(Environment.prod)
@LazySingleton(as: AppConfig)
class AppConfigProd implements AppConfig {
  @override
  String get baseUrl => "https://api.pexels.com";
  @override
  String get appName => "BG Photos & Videos";
  @override
  String get apiKey => pexelsApi;
}

@Environment(Environment.dev)
@Environment(Environment.test)
@LazySingleton(as: AppConfig)
class DevConfig implements AppConfig {
  @override
  String get baseUrl => "https://api.pexels.com";
  @override
  String get appName => "[DEV] BG Photos & Photos";
  @override
  String get apiKey => pexelsApi;
}
