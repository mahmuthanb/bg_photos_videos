// Flutter imports:
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final double width;
  const LoadingView({
    Key? key,
    this.width = 36,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image(
      image: const AssetImage('assets/loading.jpg'),
      width: width,
    ));
  }
}
