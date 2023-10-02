enum TableRecipe {
  code,
  quantity,
  mealType,
  name,
  description,
  recipe;

  String get value {
    return switch (this) {
      TableRecipe.code => 'code',
      TableRecipe.quantity => 'quantity',
      TableRecipe.mealType => 'meal_type',
      TableRecipe.name => 'name',
      TableRecipe.description => 'description',
      TableRecipe.recipe => 'recipe',
    };
  }

  static String get tableName => 'recipes';
}

enum TableIngredientQuantity {
  id,
  recipe,
  count,
  unit,
  ingredient;

  String get value {
    switch (this) {
      case TableIngredientQuantity.id:
        return 'id';
      case TableIngredientQuantity.recipe:
        return 'recipe';
      case TableIngredientQuantity.unit:
        final unitsColumns =
            TableUnit.values.map((e) => e.value).toList().join(',');
        return '${TableUnit.tableName}($unitsColumns)';
      case TableIngredientQuantity.count:
        return 'count';
      case TableIngredientQuantity.ingredient:
        final ingredientsColumns =
            TableIngredient.values.map((e) => e.value).toList().join(',');
        return '${TableIngredient.tableName}($ingredientsColumns)';
    }
  }

  static String get tableName => 'ingredient_quantity';
}

enum TableUnit {
  code,
  name;

  String get value {
    return switch (this) {
      TableUnit.code => 'code',
      TableUnit.name => 'name',
    };
  }

  static String get tableName => 'unit';
}

enum TableIngredient {
  code,
  name;

  String get value {
    return switch (this) {
      TableIngredient.code => 'code',
      TableIngredient.name => 'name',
    };
  }

  static String get tableName => 'ingredient';
}
