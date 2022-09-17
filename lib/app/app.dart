import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/app/config.dart';
import 'package:restaurant_app/app/routes.dart';
import 'package:restaurant_app/core/core.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:
            AppConfig.transparentStatusBar ? Colors.transparent : null,
      ),
    );

    return MaterialApp(
      title: AppConfig.appName,
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppColors.primaryColor,
              onPrimary: AppColors.deepPurple,
              secondary: AppColors.primaryColor,
            ),
        textTheme: AppTextTheme.textTheme,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: AppColors.primaryColor,
          shadowColor: AppColors.primaryColor.withOpacity(.5),
          titleTextStyle: Theme.of(context).textTheme.headline6?.copyWith(
                color: AppColors.primaryColor,
              ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.primaryColor.withOpacity(.5),
          selectedLabelStyle: GoogleFonts.sourceSansPro(),
          unselectedLabelStyle: GoogleFonts.sourceSansPro(),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: Dimens.dp12,
            horizontal: Dimens.dp16,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.dp16),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(Dimens.dp16),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(Dimens.dp16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(Dimens.dp16),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).errorColor,
            ),
            borderRadius: BorderRadius.circular(Dimens.dp16),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).errorColor,
            ),
            borderRadius: BorderRadius.circular(Dimens.dp16),
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        tabBarTheme: TabBarTheme(
          labelColor: AppColors.primaryColor,
          labelStyle: Theme.of(context).textTheme.subtitle2,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: AppColors.deepPurple[200],
            backgroundColor: AppColors.blue,
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.dp16,
              vertical: Dimens.dp12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.dp50),
            ),
            side: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.dp50),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.dp16,
              vertical: Dimens.dp12,
            ),
            side: BorderSide(color: Theme.of(context).errorColor),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: AppRouter.routes,
      initialRoute: '/',
    );
  }
}
