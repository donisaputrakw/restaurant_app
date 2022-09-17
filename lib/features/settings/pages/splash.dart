import 'dart:math';

import 'package:flutter/material.dart';
import 'package:restaurant_app/app/config.dart';
import 'package:restaurant_app/core/core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final Tween<double> _animationTween = Tween(begin: 0, end: pi * 2);

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).whenComplete(
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        '/auth',
        (route) => false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: _animationTween,
              duration: const Duration(seconds: 4),
              builder: (context, double value, child) {
                return Transform.rotate(
                  angle: value,
                  child: Hero(
                    tag: MainAssets.logo,
                    child: Image.asset(
                      MainAssets.logo,
                      width: Dimens.width(context) / 2,
                    ),
                  ),
                );
              },
            ),
            Text(
              AppConfig.appName,
              style: textTheme.headline3?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Rasa Enak, Harganya Lebih Enak!',
              style: textTheme.subtitle2?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
