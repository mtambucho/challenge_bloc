import 'package:challenge_bloc/common/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecipeItemLoading extends StatelessWidget {
  const RecipeItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 100,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade500,
        child: const RecipesItemLoading(),
      ),
    );
  }
}

class RecipesItemLoading extends StatelessWidget {
  const RecipesItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.star),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.shopping_cart),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 20,
                    color: Colors.grey,
                    width: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 20,
                    color: Colors.grey,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: AppColors.grey,
            size: 30,
          ),
        ],
      ),
    );
  }
}
