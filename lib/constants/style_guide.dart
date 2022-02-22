import 'package:flutter/material.dart';

const double kMobilePadding = 18.0;
const double kGlobalRadius = 8.0;

// Light Theme
const Color kPrimaryColor = Colors.grey;
Color kPrimaryScaffoldColor = Colors.grey.shade100;

// Dark Theme
const Color dPrimaryColor = Colors.black;
Color dPrimaryScaffoldColor = Colors.black;

ThemeData customTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: kPrimaryScaffoldColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: kPrimaryColor,
    foregroundColor: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(12),
    filled: true,
    fillColor: Colors.grey.shade200,
    prefixIconColor: Colors.grey.shade500,
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(kGlobalRadius))),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(kGlobalRadius))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(kGlobalRadius))),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(kGlobalRadius))),
    isDense: true,
  ),
);

ThemeData customDarkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: dPrimaryScaffoldColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: dPrimaryColor,
    foregroundColor: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(12),
    filled: true,
    fillColor: Colors.grey.shade800,
    prefixIconColor: Colors.white,
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(kGlobalRadius))),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(kGlobalRadius))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(kGlobalRadius))),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(kGlobalRadius))),
    isDense: true,
  ),
);
