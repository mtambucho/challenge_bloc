import 'package:flutter/material.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({super.key});
  static Page<void> page() => const MaterialPage<void>(child: ChallengePage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('challenge')),
    );
  }
}
