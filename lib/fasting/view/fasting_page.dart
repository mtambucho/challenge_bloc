import 'package:flutter/material.dart';

class FastingPage extends StatelessWidget {
  const FastingPage({super.key});
  static Page<void> page() => const MaterialPage<void>(child: FastingPage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('fasting')),
    );
  }
}
