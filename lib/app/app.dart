import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:restaurant_app/app/config.dart';
import 'package:restaurant_app/app/routes.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/home/home.dart';
import 'package:restaurant_app/features/restaurant/restaurant.dart';
import 'package:restaurant_app/features/search/search.dart';
import 'package:restaurant_app/l10n/l10n.dart';

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

    return MultiBlocProvider(
        providers: [
          BlocProvider<RestaurantBloc>(
            create: (BuildContext context) => RestaurantBloc(
              homeApiDataSource: HomeApiDataSourceImpl(),
              networkInfo: NetworkInfoImpl(
                connectionChecker: InternetConnectionChecker(),
              ),
            )..add(FetchRestaurantEvent()),
          ),
          BlocProvider<SearchBloc>(
            create: (BuildContext context) => SearchBloc(
              searchApiDataSource: SearchApiDataSourceImpl(),
              networkInfo: NetworkInfoImpl(
                connectionChecker: InternetConnectionChecker(),
              ),
            ),
          ),
          BlocProvider<DetailRestaurantBloc>(
            create: (BuildContext context) => DetailRestaurantBloc(
              restaurantApiDataSource: RestaurantApiDataSourceImpl(),
              networkInfo: NetworkInfoImpl(
                connectionChecker: InternetConnectionChecker(),
              ),
            ),
          ),
          BlocProvider<ReviewBloc>(
            create: (BuildContext context) => ReviewBloc(
              restaurantApiDataSource: RestaurantApiDataSourceImpl(),
              networkInfo: NetworkInfoImpl(
                connectionChecker: InternetConnectionChecker(),
              ),
            ),
          ),
        ],
        child: MaterialApp(
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
                vertical: Dimens.dp10,
                horizontal: Dimens.dp16,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.dp8),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(Dimens.dp8),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(Dimens.dp8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(Dimens.dp8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).errorColor,
                ),
                borderRadius: BorderRadius.circular(Dimens.dp8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).errorColor,
                ),
                borderRadius: BorderRadius.circular(Dimens.dp8),
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
                  borderRadius: BorderRadius.circular(Dimens.dp8),
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
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          routes: AppRouter.routes,
          initialRoute: '/',
        ));
  }
}
