import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
    this.message,
  }) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * .5,
      color: Colors.red.shade400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning,
            color: Colors.white,
            size: 50,
          ),
          Text(
            message!.isNotEmpty ? message! : "unable to load data",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
