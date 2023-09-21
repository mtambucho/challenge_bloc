part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.recipes,
    this.itemsInCart = 0,
  });

  final HomeStatus status;
  final int itemsInCart;

  @override
  List<Object> get props => [status, itemsInCart];

  HomeState copyWith({
    HomeStatus? status,
    int? itemsInCart,
  }) {
    return HomeState(
      status: status ?? this.status,
      itemsInCart: itemsInCart ?? this.itemsInCart,
    );
  }
}
