part of 'recipes_cubit.dart';

class RecipesState extends Equatable {
  const RecipesState({
    required this.mealType,
    required this.value,
    this.recipes,
  });
  final RecipeValue value;
  final List<Recipe>? recipes;
  final MealType mealType;

  @override
  List<Object> get props => [value, recipes ?? [], mealType];

  RecipesState copyWith({
    RecipeValue? value,
    List<Recipe>? recipes,
    MealType? mealType,
  }) {
    return RecipesState(
      value: value ?? this.value,
      recipes: recipes ?? this.recipes,
      mealType: mealType ?? this.mealType,
    );
  }
}
