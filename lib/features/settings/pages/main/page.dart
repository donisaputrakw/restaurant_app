import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/settings/settings.dart';
import 'package:restaurant_app/l10n/l10n.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc(),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late bool _isActivate = false;

  @override
  void initState() {
    context.read<NotificationBloc>().add(StartedNotificationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationBloc, NotificationState>(
      listener: (context, state) {
        if (state is NotificationSuccess) {
          setState(() {
            _isActivate = state.isActivate;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.profile,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: Icon(
                Icons.person,
                size: Dimens.dp40,
                color: AppColors.primaryColor,
              ),
              title: Text(
                'DONI MULYA SYAHPUTRA',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              subtitle: Text(
                'donisaputrakw@gmail.com',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            const SizedBox(height: Dimens.defaultPadding),
            ListTile(
              title: Text(
                context.l10n.changeLanguage,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                context.l10n.languageDesc,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                AppSettings.openDeviceSettings();
              },
            ),
            ListTile(
              title: Text(
                context.l10n.restaurantNotification,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                context.l10n.enableNotification,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: Switch(
                  value: _isActivate,
                  onChanged: (v) {
                    setState(() {
                      context
                          .read<NotificationBloc>()
                          .add(ActivateNotificationEvent(v));
                    });
                  }),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(Dimens.defaultPadding),
              child: OutlinedButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
