// import 'package:flutter/material.dart';

import 'dart:developer';

import 'package:challenge_bloc/features/fav/fav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavStarWidget extends StatelessWidget {
  const FavStarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        log('FavStarWidget: ${state.showFavorites}');
        return IconButton(
          onPressed: () => context.read<FavCubit>().toggleFav(),
          icon: state.showFavorites
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border),
        );
      },
    );
  }
}