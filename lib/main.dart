// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:bg_photos_videos/app/page/app/view/app.dart';
import 'package:bg_photos_videos/core/di/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI(Environment.dev);
  runApp(const MainApp());
}
