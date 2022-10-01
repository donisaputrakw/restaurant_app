import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';
export 'package:flutter_localizations/flutter_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  CupertinoLocalizations get l10nCupertino => CupertinoLocalizations.of(this);

  MaterialLocalizations get l10nMaterial => MaterialLocalizations.of(this);
}
