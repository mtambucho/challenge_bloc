import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///create cart widget
class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static Page<void> page() => const MaterialPage<void>(child: CartPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.flow<CartNavState>().complete(),
        ),
        title: Text(context.l10n.cart),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return CartItemWidget(
                      recipe: item.recipe,
                      count: item.count,
                      onCountChanged: (count) {
                        context.read<CartCubit>().addItemCount(item, count);
                      },
                      onRemoved: () {
                        context.read<CartCubit>().removeItem(item);
                      },
                    );
                  },
                ),
              ),
              CartButton(
                enabled: state.items.isNotEmpty,
              ),
            ],
          );
        },
      ),
    );
  }
}