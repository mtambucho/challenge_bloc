import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/appbar/appbar.dart';
import 'package:challenge_bloc/features/recipe_details/application/recipe_details_cubit.dart';
import 'package:challenge_bloc/features/recipe_details/application/recipe_details_state.dart';
import 'package:challenge_bloc/features/recipe_details/recipe_details.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///create a widget to show the details of a recepy
/// `name` `type` `week` `description` `ingredients`

class RecipeDetailsView extends StatelessWidget {
  const RecipeDetailsView({
    required this.recipe,
    required this.mealType,
    super.key,
  });
  final Recipe recipe;
  final MealType mealType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<RecipeDetailsCubit, RecipeDetailsState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mealType.toStringValue(context.l10n).toUpperCase(),
                        style: RecipeDetailsStyles.mealTypeStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        recipe.name,
                        style: RecipeDetailsStyles.titleStyle,
                      ),
                      RecipeDetailsIcons(
                        portions: state.recipesAmount,
                        onChange:
                            context.read<RecipeDetailsCubit>().changeAmount,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      IngredientsWidget(
                        recipe: recipe,
                        people: state.recipesAmount,
                      ),
                      if (recipe.receta != null &&
                          (recipe.receta?.isNotEmpty ?? false))
                        RecepyDetailsRecipe(recipe: recipe),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
