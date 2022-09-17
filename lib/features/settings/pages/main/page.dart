import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
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
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/auth', (route) => false);
              },
              child: Text(
                'Logout',
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
