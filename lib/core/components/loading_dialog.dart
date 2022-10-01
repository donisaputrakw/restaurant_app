import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    Key? key,
    this.barrierDismissible,
    this.onDismiss,
  }) : super(key: key);

  final bool? barrierDismissible;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    return _DialogBackground(
      barrierDismissible: barrierDismissible,
      onDismiss: onDismiss,
      dialog: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
        padding: const EdgeInsets.all(Dimens.dp16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(
              width: Dimens.dp28,
              height: Dimens.dp28,
              child: CircularProgressIndicator(strokeWidth: 1),
            ),
            SizedBox(height: Dimens.dp12),
            Text('Laoding....'),
          ],
        ),
      ),
    );
  }
}

class _DialogBackground extends StatelessWidget {
  const _DialogBackground({
    required this.dialog,
    this.barrierDismissible,
    this.onDismiss,
  });

  final Widget dialog;

  final bool? barrierDismissible;

  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: WillPopScope(
        onWillPop: () async {
          if (barrierDismissible ?? true) {
            onDismiss?.call();
          }
          Navigator.pop(context);
          return true;
        },
        child: Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: barrierDismissible ?? true
                  ? () {
                      onDismiss?.call();
                      Navigator.pop(context);
                    }
                  : () {},
              child: Container(
                color: Colors.transparent,
              ),
            ),
            dialog,
          ],
        ),
      ),
    );
  }
}
