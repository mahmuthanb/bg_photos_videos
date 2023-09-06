import 'package:bg_photos_videos/app/page/app/view/app.dart';
import 'package:bg_photos_videos/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI(Environment.dev);
  runApp(const MainApp());
}
