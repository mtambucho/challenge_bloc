import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.repository)
      : super(CartState(items: repository.getCartList()));
  final CartRepository repository;

  ///total items in the cart
  int get totalItems => state.items.length;

  ///create a function to add ingredients to the cart
  void addOrRemoveItem(Recipe recipe) {
    late List<CartItem> items;

    ///check if the item recipe exist in the cart increment the count
    if (state.items.any((element) => element.recipe.name == recipe.name)) {
      ///remove from state
      items = state.items
          .where((element) => element.recipe.name != recipe.name)
          .toList();
    }

    ///create a new item
    else {
      items = [...state.items, CartItem(recipe: recipe)];
    }

    ///save in storage
    repository.saveCartList(state.items);

    ///update state
    emit(CartState(items: items));
  }

  ///create a function to add ingredients to the cart
  void addItemCount(CartItem item, int count) {
    ///check if the item recipe exist in the cart increment the count
    if (state.items.any((element) => element.recipe.name == item.recipe.name)) {
      final items = state.items
          .map(
            (e) => e.recipe.name == item.recipe.name
                ? CartItem(recipe: e.recipe, count: count)
                : e,
          )
          .toList();

      ///save in storage
      repository.saveCartList(state.items);

      ///update state
      emit(CartState(items: items));
      return;
    }
  }

  ///create a function to remove ingredients from the cart
  void removeItem(CartItem ingredient) {
    final items = state.items
        .where((element) => element.recipe.name != ingredient.recipe.name)
        .toList();

    ///save in storage
    repository.saveCartList(state.items);

    ///update state
    emit(CartState(items: items));
  }
}
