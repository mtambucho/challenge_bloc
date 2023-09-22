import 'package:challenge_bloc/features/cart/application/cart_nav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartNavCubit extends Cubit<CartNavState> {
  CartNavCubit(super.initialState);

  void goToCart() {
    emit(CartNavState.cart);
  }

  void goToShoppingList() {
    emit(CartNavState.shoppingList);
  }
}
