import 'package:bg_photos_videos/core/alert/toast.dart';
import 'package:bg_photos_videos/core/di/locator.dart';
import 'package:flutter/material.dart';

class InfoMessage {
  Status status;
  String? title;
  String? message;
  SnackBarDuration duration;

  InfoMessage(
      {this.status = Status.success,
      this.title,
      this.message,
      this.duration = SnackBarDuration.long});

  void toast(BuildContext context) {
    Toast.show("${title ?? ""} $message".trim(), context,
        backgroundColor: _getColor(status),
        duration: _getTime(duration).inSeconds,
        gravity: 0,
        rootNavigator: true);
  }

  void showMaterialBanner(BuildContext context, {List<Widget>? actions}) {
    ScaffoldMessenger.of(context)
      ..removeCurrentMaterialBanner()
      ..showMaterialBanner(MaterialBanner(
          backgroundColor: _getColor(status),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (title != null)
                DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.white),
                  child: Text(
                    title!,
                  ),
                ),
              if (message != null)
                DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.white),
                  child: Text(
                    message.toString().trim(),
                  ),
                ),
            ],
          ),
          leading: Icon(
            _getIcon(status),
            color: Colors.white,
            size: 36,
          ),
          actions: actions ??
              [
                TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).clearMaterialBanners();
                    },
                    child: const Text(
                      "Tamam",
                      style: TextStyle(color: Colors.white),
                    )),
              ]));
  }

  void snack({SnackBarAction? action}) {
    getIt<AppRoute>()
        .mainNavigatorKey
        .currentContext
        ?.let((context) => ScaffoldMessenger.of(context)
          ..removeCurrentMaterialBanner()
          ..showSnackBar(SnackBar(
            content: Row(
              children: [
                Icon(
                  _getIcon(status),
                  color: Colors.white,
                  size: 36,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (title != null)
                          DefaultTextStyle(
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.white),
                            child: Text(
                              title!,
                            ),
                          ),
                        if (message != null)
                          DefaultTextStyle(
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.white),
                            child: Text(
                              message.toString().trim(),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: _getColor(status),
            duration: _getTime(duration),
            action: action,
            behavior: SnackBarBehavior.floating,
            elevation: 0,
          )));
  }

  IconData _getIcon(Status s) {
    switch (s) {
      case Status.success:
        return Icons.info;
      case Status.error:
        return Icons.error;
      case Status.info:
        return Icons.info;
      case Status.warning:
        return Icons.warning;
      default:
        return Icons.info;
    }
  }

  Color _getColor(Status s) {
    switch (s) {
      case Status.success:
        return Colors.green;
      case Status.error:
        return Colors.red;
      case Status.info:
        return Colors.blue;
      case Status.warning:
        return Colors.yellow;
      default:
        return Colors.blue;
    }
  }

  Duration _getTime(SnackBarDuration s) {
    switch (s) {
      case SnackBarDuration.indefinite:
        return const Duration(minutes: 1);
      case SnackBarDuration.long:
        return const Duration(milliseconds: 2750);
      default:
        return const Duration(milliseconds: 1500);
    }
  }
}

enum Status { success, error, info, warning }

enum SnackBarDuration { indefinite, long, short }
