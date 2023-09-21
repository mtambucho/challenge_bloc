import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/appbar/appbar.dart';
import 'package:challenge_bloc/features/recipes/application/recipes_cubit.dart';
import 'package:challenge_bloc/features/recipes/application/recipes_state.dart';
import 'package:challenge_bloc/features/recipes/presentation/widgets/recipes_list.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<RecipesCubit>().getRecipes();
    return BlocBuilder<RecipesCubit, RecipesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            titleImage: state.mealType.imageURL(),
            title: state.mealType.toStringValue(context.l10n),
            showFav: true,
          ),
          body: Column(
            children: [
              MealsBubbles(
                onSelected: context.read<RecipesCubit>().changeMealType,
                selected: state.mealType,
                canChangeCategory: true,
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    return state.value.when(
                      (data) => RecipesList(data, state.mealType, (recipe) {}),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error) => Text(error.toString()),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
