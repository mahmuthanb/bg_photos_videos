// Flutter imports:
import 'package:flutter/material.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("VIDEOS SCREEN"),
          Text("VIDEOS SCREEN"),
        ],
      ),
    );
  }
}
