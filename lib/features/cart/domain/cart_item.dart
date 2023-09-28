import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1)
class CartItem extends HiveObject {
  CartItem({required this.recipe, this.count = 1});

  @HiveField(0)
  final Recipe recipe;
  @HiveField(1)
  final int count;
}
