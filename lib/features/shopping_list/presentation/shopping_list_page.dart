import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:challenge_bloc/features/shopping_list/shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: ShoppingListPage());

  @override
  Widget build(BuildContext context) {
    final cartItems = context.read<CartCubit>().state.items;
    return BlocProvider(
      create: (_) => ShoppingListCubit(cartItems),
      child: const ShoppingListView(),
    );
  }
}
