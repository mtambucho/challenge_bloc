import 'package:challenge_bloc/common/services/settings_service.dart';
import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/settings/settings.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this.settingsService);

  final SettingsService settingsService;

  @override
  SettingsItem getSettings() {
    return settingsService.getSettings();
  }

  @override
  Future<void> saveFirstDay(DateTime? firstDay) {
    return settingsService.saveFirstDay(firstDay);
  }

  @override
  Future<void> saveLanguageCode(Language language) {
    return settingsService.saveLanguageCode(language);
  }
}
