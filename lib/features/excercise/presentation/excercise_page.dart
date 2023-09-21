import 'package:flutter/material.dart';

class ExcercisePage extends StatelessWidget {
  const ExcercisePage({super.key});
  static Page<void> page() => const MaterialPage<void>(child: ExcercisePage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('excercise')),
    );
  }
}
