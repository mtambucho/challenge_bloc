part of 'recipe_details_cubit.dart';

class RecipeDetailsState extends Equatable {
  const RecipeDetailsState({
    required this.recipesAmount,
    required this.recipe,
    required this.mealType,
  });
  final int recipesAmount;
  final Recipe? recipe;
  final MealType? mealType;

  bool get isLoading => recipe == null || mealType == null;

  @override
  List<Object?> get props => [
        recipesAmount,
        recipe,
        mealType,
      ];

  RecipeDetailsState copyWith({
    int? recipesAmount,
    Recipe? recipe,
    MealType? mealType,
  }) {
    return RecipeDetailsState(
      recipesAmount: recipesAmount ?? this.recipesAmount,
      recipe: recipe ?? this.recipe,
      mealType: mealType ?? this.mealType,
    );
  }
}
