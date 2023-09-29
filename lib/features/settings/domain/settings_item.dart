import 'package:challenge_bloc/common/enums/language.dart';
import 'package:hive/hive.dart';

part 'settings_item.g.dart';

@HiveType(typeId: 4)
class SettingsItem extends HiveObject {
  SettingsItem({required this.languageCode, this.firstDay});

  @HiveField(0)
  final Language languageCode;
  @HiveField(1)
  final DateTime? firstDay;
}
