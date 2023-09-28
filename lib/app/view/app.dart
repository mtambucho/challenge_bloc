import 'dart:developer';

import 'package:challenge_bloc/common/services/recipe_service.dart';
import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:challenge_bloc/features/fav/application/fav_cubit.dart';
import 'package:challenge_bloc/features/fav/domain/fav_repository.dart';
import 'package:challenge_bloc/features/fav/infrastructure/fav_repository_impl.dart';
import 'package:challenge_bloc/l10n/application/localization_cubit.dart';
import 'package:challenge_bloc/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class App extends StatelessWidget {
  const App({
    required this.recipesRepository,
    required this.cartService,
    required this.recipeService,
    super.key,
  });
  final RecipesRepository recipesRepository;
  final CartService cartService;
  final RecipeService recipeService;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        _configureRecipesRepository(),
        _configureFavRepository(),
        _configureCartRepository(),
      ],
      child: MultiBlocProvider(
        providers: [
          _configureFavCubit(),
          _configureCartCubit(),
          _configureLocalizationCubit(),
        ],
        child: BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.appThemeData,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const AuthenticationFlow(),
              locale: state.locale,
            );
          },
        ),
      ),
    );
  }

  Locale getLocale() {
    final localeStr = Intl.getCurrentLocale();
    log('localeStr==>>>$localeStr');

    if (localeStr.length >= 2) {
      return Locale(localeStr.substring(0, 2));
      // return const Locale('es');
    } else {
      return const Locale('en');
    }
  }

  BlocProvider<LocalizationCubit> _configureLocalizationCubit() {
    return BlocProvider<LocalizationCubit>(
      create: (context) =>
          LocalizationCubit(LocalizationState(locale: getLocale())),
    );
  }

  BlocProvider<CartCubit> _configureCartCubit() {
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit(
        context.read<CartRepository>(),
      ),
    );
  }

  BlocProvider<FavCubit> _configureFavCubit() {
    return BlocProvider<FavCubit>(
      create: (context) => FavCubit(context.read<FavRepository>()),
    );
  }

  RepositoryProvider<RecipesRepository> _configureRecipesRepository() =>
      RepositoryProvider<RecipesRepository>(
        create: (_) => recipesRepository,
      );

  RepositoryProvider<FavRepository> _configureFavRepository() =>
      RepositoryProvider<FavRepository>(
        create: (_) => FavRepositoryImpl(
          recipeService,
        ),
      );

  RepositoryProvider<CartRepository> _configureCartRepository() =>
      RepositoryProvider<CartRepository>(
        create: (_) => CartRepositoryImpl(
          hiveStorageManager: cartService,
        ),
      );
}
