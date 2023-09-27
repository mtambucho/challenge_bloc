// import 'package:flutter/material.dart';

import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:flutter/material.dart';

class FavRecipeWidget extends StatelessWidget {
  const FavRecipeWidget({required this.isFavorite, super.key, this.onPressed});
  final bool isFavorite;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: isFavorite
          ? const Icon(
              Icons.star,
              color: AppColors.golden,
            )
          : const Icon(Icons.star_border),
    );
  }
}
