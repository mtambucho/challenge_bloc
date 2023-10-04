import 'package:challenge_bloc/common/services/dynamic_link/dynamic_link.dart';
import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/common/widgets/share_widget.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipe_details/recipe_details.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:challenge_bloc/l10n/l10n.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recipe_details_state.dart';

class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  RecipeDetailsCubit({
    required this.redirect,
    required this.recipesRepository,
    required this.language,
    Recipe? recipe,
    MealType? mealType,
  }) : super(
          RecipeDetailsState(
            recipesAmount: recipe?.rendimiento ?? 0,
            recipe: recipe,
            mealType: mealType,
          ),
        ) {
    init();
  }

  final DeepLinkRedirect? redirect;
  final RecipesRepository recipesRepository;
  final Language language;

  Future<void> init() async {
    if (state.recipe == null && redirect != null) {
      final recipe = await recipesRepository.getRecipe(
        RecipeParams(
          recipeCode: redirect!.params['recipeCode']!,
          language: language,
        ),
      );
      if (recipe != null) {
        emit(
          state.copyWith(
            recipesAmount: recipe.rendimiento,
            recipe: recipe,
            mealType: recipe.mealType,
          ),
        );
      } else {
        ///error hanling
      }
    }
  }

  void _addAmount() {
    emit(state.copyWith(recipesAmount: state.recipesAmount + 1));
  }

  void _removeAmount() {
    if (state.recipesAmount > 1) {
      emit(state.copyWith(recipesAmount: state.recipesAmount - 1));
    }
  }

  void _setDefaultAmount() {
    if (state.recipesAmount > 1) {
      emit(state.copyWith(recipesAmount: state.recipe?.rendimiento));
    }
  }

  void changeAmount(RecipePortionsChange value) {
    switch (value) {
      case RecipePortionsChange.add:
        _addAmount();
      case RecipePortionsChange.remove:
        _removeAmount();
      case RecipePortionsChange.defaultPortions:
        _setDefaultAmount();
    }
  }

  ShareData createShareLink(AppLocalizations l10n) {
    final link = DeepLinkRedirect(
      event: DeepLinkRedirectEvent.recipeDetails,
      params: {
        'recipeCode': state.recipe!.code,
      },
    ).createLink;

    return ShareData(link: link, subject: l10n.shareRecipeSubject);
  }
}
