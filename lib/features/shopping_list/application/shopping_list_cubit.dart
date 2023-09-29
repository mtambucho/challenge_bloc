import 'package:challenge_bloc/features/cart/domain/cart_item.dart';
import 'package:challenge_bloc/features/shopping_list/shopping_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListState> {
  ShoppingListCubit(List<CartItem> items)
      : _items = items,
        super(const ShoppingListState(items: [])) {
    init();
  }
  final List<CartItem> _items;

  void init() {
    var items = <ShoppingListItem>[];
    for (final element in _items) {
      for (final ingredient in element.recipe.ingredients) {
        ///check if ingredient exists in item, if exists add the quantities
        /// in the ingredients if not add a new item
        if (items.any((e) => e.ingredient.name == ingredient.name)) {
          items = items
              .map(
                (e) => e.ingredient.name == ingredient.name &&
                        e.ingredient.unit == e.ingredient.unit
                    ? ShoppingListItem(
                        ingredient: e.ingredient.copyWith(
                          quantity: e.ingredient.quantity +
                              (ingredient.quantity * element.count),
                        ),
                        status: e.status,
                      )
                    : e,
              )
              .toList();
          continue;
        } else {
          ///multiply all ingredients in ingredient with the count of the
          ///recipe and addit to the items
          items.add(
            ShoppingListItem(
              ingredient: ingredient.copyWith(
                quantity: ingredient.quantity * element.count,
              ),
            ),
          );
        }
      }
    }

    emit(state.copyWith(items: items));
  }

  ///create a function to change the purchase status of the item
  void changePurchaseStatus(
    ShoppingListItem item,
    ShoppingListItemStatus status,
  ) {
    final items = state.items
        .map(
          (e) => e.ingredient.name == item.ingredient.name
              ? ShoppingListItem(ingredient: e.ingredient, status: status)
              : e,
        )
        .toList()
      ..sort((a, b) => b.status.index.compareTo(a.status.index));

    emit(
      ShoppingListState(items: items),
    );
  }
}
