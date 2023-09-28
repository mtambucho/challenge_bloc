// import 'package:flutter/material.dart';

import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/fav/fav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavStarWidget extends StatelessWidget {
  const FavStarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        return IconButton(
          key: const Key('favStarButton'),
          onPressed: () => context.read<FavCubit>().toggleFav(),
          icon: state.showFavorites
              ? const Icon(
                  Icons.star,
                  color: AppColors.golden,
                )
              : const Icon(Icons.star_border, color: AppColors.black),
        );
      },
    );
  }
}
