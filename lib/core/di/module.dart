import 'package:bg_photos_videos/app/data/api_provider.dart';
import 'package:bg_photos_videos/core/source/app_config.dart';
import 'package:bg_photos_videos/core/di/locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class AppModule {
  Dio get injectRetrofit {
    Dio dio = Dio(
      BaseOptions(
          baseUrl: getIt<AppConfig>().baseUrl,
          connectTimeout: const Duration(milliseconds: 10000),
          receiveTimeout: const Duration(milliseconds: 10000),
          sendTimeout: const Duration(milliseconds: 10000),
          headers: {"Authorization": getIt<AppConfig>().apiKey}),
    );
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
