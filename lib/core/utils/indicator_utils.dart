import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';

class IndicatorsUtils {
  static void showLoadingSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragStart: (_) {},
            child: Row(
              children: const [
                Expanded(child: Text('Please wait...')),
                CircularProgressIndicator(),
              ],
            ),
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(days: 1),
        ),
      );
  }

  static void showErrorSnackBar(BuildContext context, String? errorMessage) {
    if (errorMessage != null && errorMessage.isNotEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
    }
  }

  static void hideCurrentSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..removeCurrentSnackBar();
  }

  static Future<void> showDialogLoading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: false,
      barrierColor: Colors.transparent,
      builder: (_) => const LoadingDialog(
        barrierDismissible: false,
      ),
    );
  }
}
