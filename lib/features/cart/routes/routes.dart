import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:challenge_bloc/features/shopping_list/presentation/shopping_list_page.dart';
import 'package:flutter/material.dart';

List<Page<dynamic>> onGenerateLocationPages(
  CartNavState status,
  List<Page<dynamic>> pages,
) {
  return switch (status) {
    CartNavState.cart => [
        CartPage.page(),
      ],
    CartNavState.shoppingList => [
        CartPage.page(),
        ShoppingListPage.page(),
      ],
  };
}
