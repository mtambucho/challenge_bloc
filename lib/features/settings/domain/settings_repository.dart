import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/features/settings/domain/settings_item.dart';

abstract class SettingsRepository {
  Future<void> saveLanguageCode(Language langCode);
  Future<void> saveFirstDay(DateTime? firstDay);
  SettingsItem? getSettings();
}
