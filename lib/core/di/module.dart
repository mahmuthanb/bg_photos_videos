import 'package:bg_photos_videos/core/data/data_source/app_config.dart';
import 'package:bg_photos_videos/core/di/locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

abstract class AppModule {
  Dio get injectRetrofit {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: getIt<AppConfig>().baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 10000,
        sendTimeout: 10000,
      ),
    );
    if (kDebugMode) {
      // dio.interceptors.add();
    }

    return dio;
  }
}
