part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.recipes,
  });

  final HomeStatus status;

  @override
  List<Object> get props => [status];

  HomeState copyWith({
    HomeStatus? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }
}
