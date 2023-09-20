import 'package:challenge_bloc/l10n/l10n.dart';
import 'package:challenge_bloc/utils/utils.dart';

enum HomeStatus {
  recipes,
  challenge,
  excercise,
  fasting,
  settings;

  static List<HomeStatus> get enabledValues => [
        recipes,
        challenge,
        fasting,
        settings,
      ];

  String toStringValue(AppLocalizations l10n) {
    return switch (this) {
      HomeStatus.recipes => l10n.home,
      HomeStatus.challenge => l10n.challenge,
      HomeStatus.excercise => l10n.excercise,
      HomeStatus.fasting => l10n.fasting,
      HomeStatus.settings => l10n.settings
    };
  }

  String get icon {
    return switch (this) {
      HomeStatus.recipes => AppImages.icRecipes,
      HomeStatus.challenge => AppImages.icChallenge,
      HomeStatus.excercise => AppImages.icTraining,
      HomeStatus.settings => AppImages.icSettings,
      HomeStatus.fasting => AppImages.icFasting,
    };
  }
}
