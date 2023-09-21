import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  static Page<void> page() => const MaterialPage<void>(child: SettingPage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('settings')),
    );
  }
}
