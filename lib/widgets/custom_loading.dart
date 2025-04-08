import 'dart:async';
import 'package:flutter/cupertino.dart';

class CustomLoading {
  static void show({
    required BuildContext context,
    String message = 'Loading...',
    IconData? icon,
    bool autoDismiss = true,
    int dismissDuration = 2000,
    int timeout = 6000,
  }) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        if (autoDismiss) {
          Future.delayed(Duration(milliseconds: dismissDuration), () {
            Navigator.of(context).pop();
          });
        } else {
          Future.delayed(Duration(milliseconds: timeout), () {
            Navigator.of(context).pop();
          });
        }

        return Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color:
                  CupertinoColors.systemBackground.darkColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: 35,
                    color: CupertinoColors.white,
                  ),
                if (icon == null)
                  const CupertinoActivityIndicator(
                    radius: 14,
                    color: CupertinoColors.white,
                  ),
                if (message.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 14,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  static void dismiss(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }
}
