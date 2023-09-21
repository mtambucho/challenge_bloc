import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipes/application/recipes_cubit.dart';
import 'package:challenge_bloc/features/recipes/presentation/recipes_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});
  static Page<void> page() => const MaterialPage<void>(child: RecipesPage());

  @override
  Widget build(BuildContext context) {
    final repository = context.read<RecipesRepository>();
    return BlocProvider(
      create: (_) => RecipesCubit(repository),
      child: const RecipesView(),
    );
  }
}
