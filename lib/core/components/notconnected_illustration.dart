import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';

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
              'Ups, sepertinya koneksi internet kamu terputus',
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
            Text(
              'silahkan periksa konesi internet kamu terlebih dahulu, jika sudah silahkan coba kembali',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Dimens.defaultPadding),
            ElevatedButton(
              onPressed: onRefresh,
              child: Text(
                'COBA LAGI',
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
