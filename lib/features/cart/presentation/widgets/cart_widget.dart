import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/common/widgets/animated_badge.dart';
import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///create a cart widget to put in the appbar
///with a cant of items to put in a badge
class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return AnimatedBadge(
          key: GlobalKey(),
          badgeItems: state.items.length,
          icon: Icons.shopping_cart,
          emptyIcon: Icons.shopping_cart_outlined,
          onPressed: () async {
            if (context.read<CartCubit>().state.items.isEmpty) {
              context.showSnackBar(message: context.l10n.cartEmpty);
            } else {
              await Navigator.of(context).push(CartFlow.route());
            }
          },
        );
      },
    );
  }
}
