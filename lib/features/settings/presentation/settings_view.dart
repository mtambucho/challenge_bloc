import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/appbar/appbar.dart';
import 'package:challenge_bloc/features/settings/presentation/settings_styles.dart';
import 'package:challenge_bloc/features/settings/presentation/widgets/date_selector.dart';
import 'package:challenge_bloc/features/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: context.l10n.settings,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const Divider(),
                  SettingsItemWidget(
                    title: context.l10n.language,
                    value: state.language.languageString(context.l10n),
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return LanguageSelector(
                            onLanguageSelected:
                                context.read<SettingsCubit>().changeLocale,
                          );
                        },
                      );
                    },
                    icon: Icons.language,
                  ),
                  const Divider(),
                  SettingsItemWidget(
                    icon: Icons.calendar_month,
                    title: context.l10n.firstDay,
                    value: state.fistDayOfChallenge
                            ?.toDate(state.language.getLocale()) ??
                        context.l10n.noDateSelected,
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return DateSelector(
                            onDateSelected: context
                                .read<SettingsCubit>()
                                .changeFirstDayOfChallenge,
                            selectedDate: state.fistDayOfChallenge,
                          );
                        },
                      );
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SettingsItemWidget extends StatelessWidget {
  const SettingsItemWidget({
    required this.title,
    required this.value,
    required this.onTap,
    required this.icon,
    super.key,
  });
  final String title;
  final String value;
  final VoidCallback onTap;
  final IconData icon;
  SettingStyles get style => SettingStyles();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: style.titleSyle,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          value,
          style: style.subtitleSyle,
        ),
      ),
      onTap: onTap,
    );
  }
}
