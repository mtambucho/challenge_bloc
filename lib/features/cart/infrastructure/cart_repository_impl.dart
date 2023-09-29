import 'package:challenge_bloc/common/services/cart_service.dart';
import 'package:challenge_bloc/features/cart/cart.dart';

class CartRepositoryImpl extends CartRepository {
  CartRepositoryImpl({
    required this.hiveStorageManager,
  });

  final CartService hiveStorageManager;

  @override
  void saveCartList(List<CartItem> items) {
    hiveStorageManager.saveCartList(items);
  }

  @override
  List<CartItem> getCartList() {
    return hiveStorageManager.getCartItems();
  }
}
