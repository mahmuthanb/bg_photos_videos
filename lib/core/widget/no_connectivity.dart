// Flutter imports:
import 'package:bg_photos_videos/core/resources/text_style.dart';
import 'package:bg_photos_videos/core/widget/loading.dart';
import 'package:flutter/material.dart';

class NoConnectivityPage extends StatelessWidget {
  const NoConnectivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
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
                    "İnternet Bağlantısı Bulunamadı",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.headline4,
                  ),
                  Text(
                    "İnternet bağlantınızı kontrol edip tekrar deneyin.",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bodyText1,
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // context.read<AppViewModel>().check();
                },
                child: const Text("Tekrar Dene")),
          ],
        ),
      ),
    );
  }
}
