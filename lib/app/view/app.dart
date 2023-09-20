import 'package:challenge_bloc/authentication/authentication.dart';
import 'package:challenge_bloc/l10n/l10n.dart';
import 'package:challenge_bloc/utils/utils.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appThemeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const AuthenticationFlow(),
    );
  }
}
