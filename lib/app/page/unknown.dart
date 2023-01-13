// Flutter imports:
import 'package:bg_photos_videos/core/resources/text_style.dart';
import 'package:bg_photos_videos/core/widget/loading.dart';
import 'package:flutter/material.dart';

class UnknownPage extends StatefulWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  _UnknownPageState createState() => _UnknownPageState();
}

class _UnknownPageState extends State<UnknownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: LoadingView(
                width: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: const [
                  Text(
                    "Sayfa Bulunamadı!",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.headline4,
                  ),
                  Text(
                    "Üzgünüz bu sayfa bulunamadı...",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bodyText1,
                  ),
                ],
              ),
            ),
            if (Navigator.canPop(context))
              ElevatedButton(
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                  child: const Text("Geri")),
          ],
        ),
      ),
    );
  }
}