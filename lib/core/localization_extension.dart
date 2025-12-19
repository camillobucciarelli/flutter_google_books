import 'package:flutter/cupertino.dart';
import 'package:flutter_google_books/l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {

  AppLocalizations get appLocalizations => AppLocalizations.of(this)!;
}