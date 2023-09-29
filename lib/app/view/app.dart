import 'package:challenge_bloc/common/services/recipe_service.dart';
import 'package:challenge_bloc/common/services/settings_service.dart';
import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:challenge_bloc/features/fav/application/fav_cubit.dart';
import 'package:challenge_bloc/features/fav/domain/fav_repository.dart';
import 'package:challenge_bloc/features/fav/infrastructure/fav_repository_impl.dart';
import 'package:challenge_bloc/features/settings/infrastructure/settings_repository_impl.dart';
import 'package:challenge_bloc/features/settings/settings.dart';
import 'package:challenge_bloc/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    required this.recipesRepository,
    required this.cartService,
    required this.recipeService,
    required this.settingsService,
    super.key,
  });
  final RecipesRepository recipesRepository;
  final CartService cartService;
  final RecipeService recipeService;
  final SettingsService settingsService;
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
        child: BlocBuilder<SettingsCubit, SettingsState>(
          buildWhen: (previous, current) {
            return previous.language != current.language;
          },
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.appThemeData,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const AuthenticationFlow(),
              locale: state.language.getLocale(),
            );
          },
        ),
      ),
    );
  }

  BlocProvider<SettingsCubit> _configureLocalizationCubit() {
    final repository = SettingsRepositoryImpl(settingsService);
    final settings = repository.getSettings();
    return BlocProvider<SettingsCubit>(
      create: (context) => SettingsCubit(
        SettingsState(
          language: settings.languageCode,
          fistDayOfChallenge: settings.firstDay,
        ),
        settingsRepository: SettingsRepositoryImpl(settingsService),
      ),
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
