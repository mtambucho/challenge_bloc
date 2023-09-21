import 'package:challenge_bloc/common/utils/service/local_store_manager.dart';
import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/fav/application/fav_cubit.dart';
import 'package:challenge_bloc/features/fav/domain/fav_repository.dart';
import 'package:challenge_bloc/features/fav/infrastructure/fav_repository_impl.dart';
import 'package:challenge_bloc/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    required this.localStorageManager,
    super.key,
  });
  final LocalStorageManager localStorageManager;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        _configureRecipesRepository(),
        _configureFavRepository(),
      ],
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<FavCubit>(
                create: (context) => FavCubit(context.read<FavRepository>()),
              ),
            ],
            child: MaterialApp(
              theme: AppTheme.appThemeData,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const AuthenticationFlow(),
            ),
          );
        },
      ),
    );
  }

  RepositoryProvider<RecipesRepository> _configureRecipesRepository() =>
      RepositoryProvider<RecipesRepository>(
        create: (context) => RecipesRepositoryImpl(
          dataSource: RecipesDataSourceImpl(),
        ),
      );

  RepositoryProvider<FavRepository> _configureFavRepository() =>
      RepositoryProvider<FavRepository>(
        create: (context) =>
            FavRepositoryImpl(localStorageManager: localStorageManager),
      );
}
