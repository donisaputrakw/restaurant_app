import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/l10n/l10n.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.profile,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.person,
              size: Dimens.dp100,
              color: AppColors.primaryColor,
            ),
            const SizedBox(height: Dimens.defaultPadding),
            Text(
              'DONI MULYA SYAHPUTRA',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Dimens.dp8),
            Text(
              'donisaputrakw@gmail.com',
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.dp50),
              )),
              onPressed: () {
                AppSettings.openDeviceSettings();
              },
              icon: Icon(
                Icons.language_rounded,
                color: Theme.of(context).canvasColor,
              ),
              label: Text(
                context.l10n.changeLanguage,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: Theme.of(context).canvasColor,
                    ),
              ),
            ),
            const SizedBox(height: Dimens.defaultPadding),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/auth', (route) => false);
              },
              child: Text(
                context.l10n.logout,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: Theme.of(context).errorColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
