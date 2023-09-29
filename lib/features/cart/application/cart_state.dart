part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({required this.items});

  final List<CartItem> items;

  @override
  List<Object?> get props => [items];
}
