import 'package:challenge_bloc/features/cart/application/cart_nav_cubit.dart';
import 'package:challenge_bloc/features/cart/application/cart_nav_state.dart';
import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartFlow extends StatelessWidget {
  const CartFlow._();

  static Route<CartNavState> route() {
    return MaterialPageRoute(builder: (_) => const CartFlow._());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartNavCubit(CartNavState.cart),
      child: const FlowBuilder<CartNavState>(
        state: CartNavState.cart,
        onGeneratePages: onGenerateLocationPages,
      ),
    );
  }
}

class CartPage1 extends StatelessWidget {
  const CartPage1({super.key});
  static Page<void> page() => const MaterialPage<void>(child: CartPage1());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.flow<CartNavState>().complete(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('CartPage1'),
            ElevatedButton(
              onPressed: () => context.flow<CartNavState>().update(
                    (status) => CartNavState.shoppingList,
                  ),
              child: const Text('Go to CartPage2'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage2 extends StatelessWidget {
  const CartPage2({super.key});
  static Page<void> page() => const MaterialPage<void>(child: CartPage2());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('CartPage2'),
      ),
    );
  }
}
