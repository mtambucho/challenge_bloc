import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/recipe_details/recipe_details.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';

class IngredientsWidget extends StatefulWidget {
  const IngredientsWidget({
    required this.recipe,
    required this.people,
    super.key,
  });

  final Recipe recipe;
  final int people;

  @override
  State<IngredientsWidget> createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.recipe.ingredients
        .map(
          (e) => getIngredientText(
            context,
            e,
            widget.people,
            widget.recipe.rendimiento,
          ),
        )
        .toList();
    return RecipeDetailsSection(items: items, title: context.l10n.ingredients);
  }

  String getIngredientText(
    BuildContext context,
    Ingredient recepyIngredient,
    int people,
    int rendimiento,
  ) {
    final totalQuantity = (recepyIngredient.quantity * people) / rendimiento;
    final cant = totalQuantity.format();
    final unit = recepyIngredient.unit?.toString() ?? '';
    final hasQuantity = cant.isNotEmpty || unit.isNotEmpty;
    final quantity = hasQuantity ? context.l10n.cantOfUnit(cant, unit) : null;

    return (quantity ?? '') + recepyIngredient.name.capitalize();
  }
}
