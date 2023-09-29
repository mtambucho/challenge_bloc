import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/features/appbar/appbar.dart';
import 'package:challenge_bloc/features/shopping_list/shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingListView extends StatelessWidget {
  const ShoppingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.l10n.purchaseList,
        showCart: false,
      ),
      body: BlocBuilder<ShoppingListCubit, ShoppingListState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];
              return ShoppingListItemWidget(
                item: item,
                onStatusChanged: (status) {
                  context
                      .read<ShoppingListCubit>()
                      .changePurchaseStatus(item, status);
                },
              );
            },
          );
        },
      ),
    );
  }
}

///create a shopping list item widget to show the name of the ingredient and the
///and the quantity to buy
///recieve a ShoppingListItem and a function to change the status of the item
///user can change the status of the item to purchased or to buy
///use the status to change the color of the widget
///use the status to show the button to change the status
class ShoppingListItemWidget extends StatelessWidget {
  const ShoppingListItemWidget({
    required this.item,
    required this.onStatusChanged,
    super.key,
  });

  final ShoppingListItem item;
  final void Function(ShoppingListItemStatus) onStatusChanged;

  @override
  Widget build(BuildContext context) {
    final quantity = item.ingredient.quantity;
    final unit = item.ingredient.unit;
    final subtitle = '${quantity.formatDouble()} ${unit ?? ''}';
    return InkWell(
      onTap: () {
        onStatusChanged(
          item.status == ShoppingListItemStatus.toBuy
              ? ShoppingListItemStatus.purchased
              : ShoppingListItemStatus.toBuy,
        );
      },
      child: ListTile(
        title: Text(
          item.ingredient.name,
          style: item.status == ShoppingListItemStatus.purchased
              ? const TextStyle(decoration: TextDecoration.lineThrough)
              : null,
        ),
        subtitle: (subtitle.trim() == '0') ? null : Text(subtitle),
        trailing: item.status == ShoppingListItemStatus.toBuy
            ? Icon(
                Icons.shopping_cart,
                color: AppColors.primary.shade200,
              )
            : const Icon(
                Icons.remove_shopping_cart,
                color: Colors.grey,
              ),
      ),
    );
  }
}
