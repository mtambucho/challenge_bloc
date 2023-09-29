import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:challenge_bloc/features/shopping_list/shopping_list.dart';
import 'package:equatable/equatable.dart';

class ShoppingListItem extends Equatable {
  const ShoppingListItem({
    required this.ingredient,
    this.status = ShoppingListItemStatus.toBuy,
  });
  final Ingredient ingredient;
  final ShoppingListItemStatus status;

  @override
  List<Object?> get props => [ingredient, status];
}
