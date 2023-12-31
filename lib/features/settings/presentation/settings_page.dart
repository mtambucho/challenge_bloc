import 'package:challenge_bloc/features/settings/presentation/settings_view.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  static Page<void> page() => const MaterialPage<void>(child: SettingPage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingsView(),
    );
  }
}
