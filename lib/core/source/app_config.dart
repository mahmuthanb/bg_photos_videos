// Package imports:
import 'package:injectable/injectable.dart';

abstract class AppConfig {
  String get appName;
  String get baseUrl;
}

@Environment(Environment.prod)
@LazySingleton(as: AppConfig)
class AppConfigProd implements AppConfig {
  @override
  String get baseUrl => "https://api.pexels.com";
  @override
  String get appName => "BG Photos & Videos";
}

@Environment(Environment.dev)
@Environment(Environment.test)
@LazySingleton(as: AppConfig)
class DevConfig implements AppConfig {
  @override
  String get baseUrl => "https://api.pexels.com";

  @override
  String get appName => "[DEV] BG Photos & Photos";
}
