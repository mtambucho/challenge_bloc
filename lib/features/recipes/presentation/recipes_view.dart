import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/features/appbar/appbar.dart';
import 'package:challenge_bloc/features/home/home.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                      (data) => RecipesList(data, state.mealType, (recipe) {
                        context.flow<HomeState>().update(
                              (homeState) => homeState.copyWith(
                                selectedRecipe: recipe,
                                selectedMealType: state.mealType,
                              ),
                            );
                      }),
                      loading: () => ListView(
                        children: List.generate(
                          6,
                          (index) => const RecipeItemLoading(),
                        ),
                      ),
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
