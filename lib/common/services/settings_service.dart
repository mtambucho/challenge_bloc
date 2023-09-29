import 'dart:developer';

import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/settings/domain/settings_item.dart';
import 'package:hive/hive.dart';

class SettingsService {
  late Box<SettingsItem> _settings;

  Future<void> init() async {
    _settings = await Hive.openBox<SettingsItem>('settings');
  }

  SettingsItem getSettings() {
    final item = _settings.values.toList().safeFirst;
    return item ??
        SettingsItem(
          languageCode: Language.getDefaultLanguage(),
        );
  }

  Future<void> saveLanguageCode(Language language) async {
    final settings = getSettings();
    await _settings.clear();
    await _settings.add(
      SettingsItem(languageCode: language, firstDay: settings.firstDay),
    );
    final settings2 = getSettings();
    log('==>>${settings2.languageCode} | ${settings2.firstDay}');
  }

  Future<void> saveFirstDay(DateTime? firstDay) async {
    final settings = getSettings();
    await _settings.clear();
    await _settings.add(
      SettingsItem(
        languageCode: settings.languageCode,
        firstDay: firstDay,
      ),
    );
  }
}
