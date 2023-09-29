part of 'recipe_details_cubit.dart';

class RecipeDetailsState extends Equatable {
  const RecipeDetailsState({required this.recipesAmount});

  final int recipesAmount;

  @override
  List<Object?> get props => [recipesAmount];

  RecipeDetailsState copyWith({
    int? recipesAmount,
  }) {
    return RecipeDetailsState(
      recipesAmount: recipesAmount ?? this.recipesAmount,
    );
  }
}
