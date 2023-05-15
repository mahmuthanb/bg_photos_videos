// Flutter imports:
import 'package:flutter/material.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
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
