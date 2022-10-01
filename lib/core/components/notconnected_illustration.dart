import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/l10n/l10n.dart';

class NotConnectedIllustration extends StatelessWidget {
  const NotConnectedIllustration({
    super.key,
    required this.onRefresh,
  });
  final Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.dp40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              color: Theme.of(context).errorColor,
              size: Dimens.dp75,
            ),
            const SizedBox(height: Dimens.defaultPadding),
            Text(
              context.l10n.titleNotConnected,
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
            Text(
              context.l10n.descNotConnected,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Dimens.defaultPadding),
            ElevatedButton(
              onPressed: onRefresh,
              child: Text(
                context.l10n.refresh.toUpperCase(),
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: Colors.white,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
