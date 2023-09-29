part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.language, this.fistDayOfChallenge});
  final Language language;
  final DateTime? fistDayOfChallenge;
  @override
  List<Object> get props => [
        language,
        fistDayOfChallenge ?? '',
      ];

  SettingsState copyWith({
    Language? language,
    DateTime? fistDayOfChallenge,
  }) {
    return SettingsState(
      language: language ?? this.language,
      fistDayOfChallenge: fistDayOfChallenge ?? this.fistDayOfChallenge,
    );
  }
}
