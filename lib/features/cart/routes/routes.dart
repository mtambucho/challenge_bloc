import 'package:challenge_bloc/features/cart/application/cart_nav_state.dart';
import 'package:challenge_bloc/features/cart/presentation/cart_flow.dart';
import 'package:challenge_bloc/features/cart/presentation/cart_page.dart';
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
        CartPage2.page(),
      ],
  };
}
