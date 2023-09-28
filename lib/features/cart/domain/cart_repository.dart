import 'package:challenge_bloc/features/cart/domain/cart_item.dart';

abstract class CartRepository {
  void saveCartList(List<CartItem> items);
  List<CartItem> getCartList();
}
