part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.selectedRecipe,
    this.selectedMealType,
    this.status = HomeStatus.recipes,
  });

  final HomeStatus status;
  final Recipe? selectedRecipe;
  final MealType? selectedMealType;

  @override
  List<Object> get props =>
      [status, selectedRecipe ?? '', selectedMealType ?? ''];

  bool get showDetails => selectedRecipe != null && selectedMealType != null;

  HomeState copyWith({
    HomeStatus? status,
    Recipe? selectedRecipe,
    MealType? selectedMealType,
  }) {
    return HomeState(
      status: status ?? this.status,
      selectedRecipe: selectedRecipe ?? this.selectedRecipe,
      selectedMealType: selectedMealType ?? this.selectedMealType,
    );
  }
}
