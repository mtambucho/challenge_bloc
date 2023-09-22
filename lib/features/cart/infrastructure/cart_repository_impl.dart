import 'package:challenge_bloc/common/utils/service/local_store_manager.dart';
import 'package:challenge_bloc/features/cart/domain/cart_item.dart';
import 'package:challenge_bloc/features/cart/domain/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  CartRepositoryImpl({required this.localStorageManager});

  final LocalStorageManager localStorageManager;

  @override
  void saveCartList(List<CartItem> item) {
    localStorageManager.saveCartList(item);
  }

  @override
  List<CartItem> getCartList() {
    return localStorageManager.getCartList();
  }
}
