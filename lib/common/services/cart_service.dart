import 'package:challenge_bloc/features/cart/domain/cart_item.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:hive/hive.dart';

class CartService {
  late Box<CartItem> _cartItems;

  Future<void> init() async {
    Hive
      ..registerAdapter(CartItemAdapter())
      ..registerAdapter(RecipeAdapter())
      ..registerAdapter(IngredientAdapter());
    _cartItems = await Hive.openBox<CartItem>('cartItems');
  }

  List<CartItem> getCartItems() {
    final items = _cartItems.values.toList();
    return items.toList();
  }

  Future<void> saveCartList(List<CartItem> items) async {
    await _cartItems.clear();
    await _cartItems.addAll(items);
  }

  void addCartItem(CartItem item) {
    _cartItems.add(item);
  }

  Future<void> removeTask(CartItem item) async {
    final itemToRemove = _cartItems.values.firstWhere(
      (element) => element == item,
    );
    await itemToRemove.delete();
  }

  Future<void> updateTask(CartItem oldItem, CartItem newItem) async {
    final itemToEdit = _cartItems.values.firstWhere(
      (element) => element == oldItem,
    );
    final index = itemToEdit.key as int;
    await _cartItems.put(index, newItem);
  }
}
