import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_nav_state.dart';

class CartNavCubit extends Cubit<CartNavState> {
  CartNavCubit(super.initialState);

  void goToCart() {
    emit(CartNavState.cart);
  }

  void goToShoppingList() {
    emit(CartNavState.shoppingList);
  }
}
