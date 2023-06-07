// Flutter imports:
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
    this.index,
    this.onTap, {
    Key? key,
  }) : super(key: key);
  final int index;
  final Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      unselectedItemColor: Colors.grey.shade400,
      selectedItemColor: Colors.grey.shade600,
      // backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: index,
      selectedIconTheme: const IconThemeData(size: 30),
      unselectedIconTheme: const IconThemeData(size: 30),
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(label: "label", icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'sadas', icon: Icon(Icons.photo)),
        BottomNavigationBarItem(label: 'gsf', icon: Icon(Icons.video_collection)),
        BottomNavigationBarItem(label: 'gsf', icon: Icon(Icons.person)),
      ],
    );
  }
}
