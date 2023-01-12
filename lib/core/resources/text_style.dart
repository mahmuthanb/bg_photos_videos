// Flutter imports:
import 'package:bg_photos_videos/core/resources/colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const TextStyle edit = TextStyle(fontSize: 16, color: AppColors.blue);
  static const TextStyle remove = TextStyle(
      fontSize: 16, color: AppColors.red, fontWeight: FontWeight.bold);
  static const TextStyle warning = TextStyle(
      fontSize: 14, color: AppColors.red, fontWeight: FontWeight.w400);
  static const TextStyle date = TextStyle(
      fontSize: 12, color: AppColors.blue, fontWeight: FontWeight.bold);
  static const TextStyle badge =
      TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.bold);
  static const TextStyle badge2 =
      TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold);
  static const TextStyle update = TextStyle(
    fontSize: 16,
    color: AppColors.primarySwatch,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );
  //
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: Colors.black,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const TextStyle headline4 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static const TextStyle headline5 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle headline6 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static const TextStyle subTitle1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w900,
    color: AppColors.text,
  );
  static const TextStyle subTitle2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w900,
    color: AppColors.text,
  );
  static const TextStyle subTitle3 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w900,
    color: AppColors.text,
  );
  static const TextStyle subTitle4 =
      TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold);

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );
  static const TextStyle bodyText3 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );
  static const TextStyle button = TextStyle(
    color: AppColors.primarySwatch,
    fontWeight: FontWeight.w900,
    fontSize: 13.0,
  );

  static const TextStyle caption = TextStyle(fontSize: 12);
  static const TextStyle caption2 =
      TextStyle(fontSize: 12, color: AppColors.darkGrey);

  static const TextStyle overline = TextStyle(
      color: AppColors.text, fontSize: 12.0, fontStyle: FontStyle.italic);
  static const TextStyle overline1 = TextStyle(
      color: AppColors.text, fontSize: 10.0, fontStyle: FontStyle.italic);
}
