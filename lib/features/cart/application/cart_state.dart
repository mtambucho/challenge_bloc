import 'package:challenge_bloc/features/cart/domain/cart_item.dart';
import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  const CartState({required this.items});

  final List<CartItem> items;

  @override
  List<Object?> get props => [items];
}
