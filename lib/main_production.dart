import 'package:challenge_bloc/app/app.dart';
import 'package:challenge_bloc/bootstrap.dart';
import 'package:challenge_bloc/common/database.dart';
import 'package:challenge_bloc/common/enums/environment.dart';
import 'package:challenge_bloc/common/services.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  const env = Environment.prod;
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: env.fileName);
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
