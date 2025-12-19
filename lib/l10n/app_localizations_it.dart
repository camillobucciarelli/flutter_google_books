// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get books => 'Libri';

  @override
  String get counter => 'Contatore';

  @override
  String pageCount(int current, int totals) {
    return 'pagina $current di $totals';
  }

  @override
  String published(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat(
      'dd MMM yyyy',
      localeName,
    );
    final String dateString = dateDateFormat.format(date);

    return 'pubblicato il $dateString';
  }

  @override
  String get system => 'Sistema';

  @override
  String pages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pagine',
      one: 'pagina',
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
