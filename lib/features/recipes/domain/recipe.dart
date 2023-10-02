import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'recipe.g.dart';

@HiveType(typeId: 2)
class Recipe extends HiveObject with EquatableMixin {
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

  @override
  List<Object?> get props => [
        code,
        name,
        description,
        ingredients,
        rendimiento,
        receta,
      ];
}

@HiveType(typeId: 3)
class Ingredient extends HiveObject with EquatableMixin {
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

  Ingredient copyWith({
    double? quantity,
    String? unit,
    String? name,
  }) {
    return Ingredient(
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [
        quantity,
        unit,
        name,
      ];
}
