import 'package:challenge_bloc/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'language.g.dart';

@HiveType(typeId: 5)
enum Language {
  @HiveField(0)
  en,
  @HiveField(1)
  es;

  Locale getLocale() {
    return switch (this) {
      Language.en => const Locale('en'),
      Language.es => const Locale('es'),
    };
  }

  String get code {
    return switch (this) {
      Language.en => 'en',
      Language.es => 'es',
    };
  }

  String languageString(AppLocalizations l10n) {
    return switch (this) {
      Language.en => '$icon ${l10n.english}',
      Language.es => '$icon ${l10n.spanish}',
    };
  }

  static Language get _defaultValue => Language.en;

  static Language fromCode(String code) {
    return switch (code) {
      'en' => Language.en,
      'es' => Language.es,
      _ => _defaultValue,
    };
  }

  static Language getDefaultLanguage() {
    final localeStr = Intl.getCurrentLocale();

    if (localeStr.length >= 2) {
      return fromCode(localeStr.substring(0, 2));
    } else {
      return _defaultValue;
    }
  }

  String get icon {
    return switch (this) {
      Language.en => '🇺🇸',
      Language.es => '🇪🇸',
    };
  }
}
