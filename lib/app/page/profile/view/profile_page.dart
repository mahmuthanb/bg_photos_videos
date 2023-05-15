// Flutter imports:
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("PROFILE SCREEN"),
          Text("PROFILE SCREEN"),
        ],
      ),
    );
  }
}
