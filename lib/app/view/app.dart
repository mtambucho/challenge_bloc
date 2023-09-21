import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({required this.recipesRepository, super.key});

  final RecipesRepository recipesRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: recipesRepository,
      child: MaterialApp(
        theme: AppTheme.appThemeData,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const AuthenticationFlow(),
      ),
    );
  }
}
