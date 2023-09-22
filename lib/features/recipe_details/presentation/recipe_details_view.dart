import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/appbar/appbar.dart';
import 'package:challenge_bloc/features/recipe_details/recipe_details.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';

///create a widget to show the details of a recepy
/// `name` `type` `week` `description` `ingredients`

class RecipeDetailsView extends StatefulWidget {
  const RecipeDetailsView({
    required this.recipe,
    required this.mealType,
    super.key,
  });
  final Recipe recipe;
  final MealType mealType;

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  late int people;
  @override
  void initState() {
    people = widget.recipe.rendimiento;
    super.initState();
  }

  void changePeople(RecipePortionsChange value) {
    switch (value) {
      case RecipePortionsChange.add:
        setState(() {
          people++;
        });
      case RecipePortionsChange.remove:
        if (people > 1) {
          setState(() {
            people--;
          });
        }
      case RecipePortionsChange.defaultPortions:
        setState(() {
          people = widget.recipe.rendimiento;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.mealType.toString().toUpperCase(),
                    style: RecipeDetailsStyles.mealTypeStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.recipe.name,
                    style: RecipeDetailsStyles.titleStyle,
                  ),
                  RecipeDetailsIcons(
                    portions: people,
                    onChange: changePeople,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  IngredientsWidget(
                    recipe: widget.recipe,
                    people: people,
                  ),
                  if (widget.recipe.receta != null &&
                      (widget.recipe.receta?.isNotEmpty ?? false))
                    RecepyDetailsRecipe(recipe: widget.recipe),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
