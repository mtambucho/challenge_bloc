import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/settings/settings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(
    super.initialState, {
    required this.settingsRepository,
    required this.recipesRepository,
  });

  final SettingsRepository settingsRepository;
  final RecipesRepository recipesRepository;

  void changeLocale(Language language) {
    if (language != state.language) {
      settingsRepository.saveLanguageCode(language);
      recipesRepository.removeCache();

      emit(
        SettingsState(
          language: language,
          fistDayOfChallenge: state.fistDayOfChallenge,
        ),
      );
    }
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
