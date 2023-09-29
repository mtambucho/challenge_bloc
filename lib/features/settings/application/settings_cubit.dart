import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/settings/settings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(
    super.initialState, {
    required this.settingsRepository,
  });

  final SettingsRepository settingsRepository;

  void changeLocale(Language language) {
    settingsRepository.saveLanguageCode(language);
    emit(
      SettingsState(
        language: language,
        fistDayOfChallenge: state.fistDayOfChallenge,
      ),
    );
  }

  void changeFirstDayOfChallenge(DateTime? date) {
    settingsRepository.saveFirstDay(date);
    emit(
      SettingsState(
        language: state.language,
        fistDayOfChallenge: date,
      ),
    );
  }
}
