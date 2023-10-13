import 'package:challenge_bloc/common/utils.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({required this.inCart, required this.onTap, super.key});
  final bool inCart;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        inCart ? Icons.shopping_cart : Icons.shopping_cart_outlined,
        color: inCart ? AppColors.primary : AppColors.disabledIcon,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      onPressed: onTap,
    );
  }
}
