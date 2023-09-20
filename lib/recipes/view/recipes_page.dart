import 'package:flutter/material.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});
  static Page<void> page() => const MaterialPage<void>(child: RecipesPage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('recipes')),
    );
  }
}
