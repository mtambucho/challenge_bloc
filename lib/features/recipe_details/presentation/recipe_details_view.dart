import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/common/widgets/cart_button.dart';
import 'package:challenge_bloc/common/widgets/share_widget.dart';
import 'package:challenge_bloc/features/appbar/appbar.dart';
import 'package:challenge_bloc/features/cart/application/cart_cubit.dart';
import 'package:challenge_bloc/features/fav/fav.dart';
import 'package:challenge_bloc/features/recipe_details/presentation/recipe_details_item.dart';
import 'package:challenge_bloc/features/recipe_details/presentation/recipe_details_loading_item.dart';
import 'package:challenge_bloc/features/recipe_details/recipe_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeDetailsView extends StatelessWidget {
  const RecipeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeDetailsCubit, RecipeDetailsState>(
      builder: (context, state) {
        late final Widget child;
        if (state.isLoading) {
          child = const RecipeDetailsLoadingItem();
        } else {
          final mealType = state.mealType!;
          final recipe = state.recipe!;
          child = RecipeDetailItem(
            mealType: mealType,
            recipe: recipe,
            recipesAmount: state.recipesAmount,
          );
        }
        return Scaffold(
          backgroundColor: AppColors.lightGrey,
          appBar: CustomAppBar(
            showCart: false,
            actions: [
              if (!state.isLoading) ...[
                ShareButton(
                  createShareLink: () => context
                      .read<RecipeDetailsCubit>()
                      .createShareLink(context.l10n),
                ),
                BlocBuilder<FavCubit, FavState>(
                  builder: (context, favState) {
                    return FavRecipeWidget(
                      isFavorite: context.read<FavCubit>().isFavorite(
                            state.recipe!,
                          ),
                      onPressed: () => context
                          .read<FavCubit>()
                          .addOrRemoveFavorite(state.recipe!),
                    );
                  },
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, cartState) {
                    return CartButton(
                      inCart:
                          context.read<CartCubit>().isFavorite(state.recipe!),
                      onTap: () => context
                          .read<CartCubit>()
                          .addOrRemoveItem(state.recipe!),
                    );
                  },
                ),
              ],
            ],
          ),
          body: SingleChildScrollView(
            child: child,
          ),
        );
      },
    );
  }
}
