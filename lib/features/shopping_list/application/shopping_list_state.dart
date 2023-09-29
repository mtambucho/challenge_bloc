part of 'shopping_list_cubit.dart';

class ShoppingListState extends Equatable {
  const ShoppingListState({required this.items});

  final List<ShoppingListItem> items;
  @override
  List<Object?> get props => [items];

  ShoppingListState copyWith({
    List<ShoppingListItem>? items,
  }) {
    return ShoppingListState(
      items: items ?? this.items,
    );
  }
}
