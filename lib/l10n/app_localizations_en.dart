// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get books => 'Books';

  @override
  String get counter => 'Counter';

  @override
  String pageCount(int current, int totals) {
    return 'page $current of $totals';
  }

  @override
  String published(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat(
      'dd MMM yyyy',
      localeName,
    );
    final String dateString = dateDateFormat.format(date);

    return 'Published on $dateString';
  }

  @override
  String get system => 'System';

  @override
  String pages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pages',
      one: 'page',
    );
    return '$_temp0';
  }

  @override
  String greetings(String gender) {
    String _temp0 = intl.Intl.selectLogic(gender, {
      'male': 'Signor',
      'female': 'Signora',
      'pippo': 'ciaone',
      'other': 'Ciao',
    });
    return '$_temp0';
  }
}
