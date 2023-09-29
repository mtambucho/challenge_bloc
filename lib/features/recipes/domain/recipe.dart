import 'package:hive/hive.dart';

part 'recipe.g.dart';

@HiveType(typeId: 2)
class Recipe extends HiveObject {
  Recipe({
    required this.code,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.rendimiento,
    this.receta,
  });

  @HiveField(0)
  final String code;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final List<Ingredient> ingredients;
  @HiveField(4)
  final int rendimiento;
  @HiveField(5)
  final List<String>? receta;
}

@HiveType(typeId: 3)
class Ingredient extends HiveObject {
  Ingredient({
    required this.quantity,
    required this.unit,
    required this.name,
  });

  @HiveField(0)
  final double quantity;
  @HiveField(1)
  final String? unit;
  @HiveField(2)
  final String name;
}
