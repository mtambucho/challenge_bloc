import 'dart:developer';

import 'package:challenge_bloc/common/services/dynamic_link/dynamic_link.dart';
import 'package:challenge_bloc/features/home/application/home_status.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void redirectToDetails(DeepLinkRedirect redirect) {
    final query = redirect.params;
    log('redirectToDetails ==>> $query');
    if (query.containsKey('recipeCode')) {
      emit(
        HomeState(
          redirect: DeepLinkRedirect(
            event: DeepLinkRedirectEvent.recipeDetails,
            params: query,
          ),
        ),
      );
    }
  }

  void goToPage(int index) {
    final page = HomeStatus.values[index];
    if (state.status != page) {
      emit(state.copyWith(status: page));
    }
  }
}
