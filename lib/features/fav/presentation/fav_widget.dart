// import 'package:flutter/material.dart';

import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/fav/fav.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavRecipeWidget extends StatelessWidget {
  const FavRecipeWidget({required this.recipe, super.key});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        final controller = context.read<FavCubit>();
        final isFavorite = controller.isFavorite(recipe);
        return IconButton(
          onPressed: () {
            if (isFavorite) {
              controller.removeFavorite(recipe);
            } else {
              controller.addFavorite(recipe);
            }
          },
          icon: isFavorite
              ? const Icon(
                  Icons.star,
                  color: AppColors.golden,
                )
              : const Icon(Icons.star_border),
        );
      },
    );
  }
}
