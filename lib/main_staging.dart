import 'package:challenge_bloc/app/app.dart';
import 'package:challenge_bloc/bootstrap.dart';
import 'package:challenge_bloc/common/database/supabase/supabase_database_client.dart';
import 'package:challenge_bloc/common/services/cart_service.dart';
import 'package:challenge_bloc/common/services/hive_service.dart';
import 'package:challenge_bloc/common/services/recipe_service.dart';
import 'package:challenge_bloc/common/services/settings_service.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: 'assets/.env');
  await Hive.initFlutter();

  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('ANON_KEY'),
  );

  await bootstrap(() async {
    HiveService.registerAdapters();
    final cartService = CartService();
    await cartService.init();

    final recipeService = RecipeService();
    await recipeService.init();

    final settingsService = SettingsService();
    await settingsService.init();

    final databaseClient = SupabaseDatabaseRecipes(
      supabaseClient: Supabase.instance.client,
    );

    final RecipesRepository recipesRepository = RecipesRepositoryImpl(
      databaseClient: databaseClient,
      recipeService: recipeService,
    );

    return App(
      settingsService: settingsService,
      cartService: cartService,
      recipeService: recipeService,
      recipesRepository: recipesRepository,
    );
  });
}
