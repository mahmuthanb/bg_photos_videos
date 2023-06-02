import 'package:flutter/material.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("PHOTOS SCREEN"),
          Text("PHOTOS SCREEN"),
        ],
      ),
    );
  }
}
