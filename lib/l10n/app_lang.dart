import 'package:cookmate/book/domain/repositories/key_values.dart';
import 'package:cookmate/core/lib/language_name.dart';
import 'package:cookmate/core/service_locator/service_locator.dart';
import 'package:cookmate/l10n/translations/translations.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AppLang {
  static Locale? _locale;
  static String? _lang;

  static List<String> get locales => sortedLocales;

  static localeByLang(String lang) {
    _locale = Locale(lang);
  }

  static Locale get locale {
    return _locale!;
  }

  static set lang(String lang) {
    if (lang.length == 2) {
      _lang = lang;
      sl<KeyValues>().set(KeyValueNames.locale, lang);
      localeByLang(lang);
    }
  }

  static S get i18n => lookupS(_locale!);

  static String get lang {
    String lang = _lang ?? "";
    if (lang.isEmpty) {
      lang = Intl.shortLocale(Intl.systemLocale);
    }

    if (_locale == null) {
      localeByLang(lang);
    }
    return lang;
  }
}
