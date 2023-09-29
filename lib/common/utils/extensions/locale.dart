import 'package:challenge_bloc/l10n/l10n.dart';
import 'package:flutter/material.dart';

extension LocaleExtension on Locale {
  String languageString(AppLocalizations l10n) {
    switch (languageCode) {
      case 'en':
        return l10n.english;
      case 'es':
        return l10n.spanish;
      default:
        return l10n.english;
    }
  }
}
