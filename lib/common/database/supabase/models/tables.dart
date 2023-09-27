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
