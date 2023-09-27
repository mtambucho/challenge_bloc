import 'package:challenge_bloc/app/app.dart';
import 'package:challenge_bloc/bootstrap.dart';
import 'package:challenge_bloc/common/database/supabase/supabase_database_client.dart';
import 'package:challenge_bloc/common/utils/service/local_store_manager.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: 'assets/.env');

  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('ANON_KEY'),
  );

  await bootstrap(() async {
    final databaseClient = SupabaseDatabaseRecipes(
      supabaseClient: Supabase.instance.client,
    );

    final RecipesRepository recipesRepository = RecipesRepositoryImpl(
      dataSource: RecipesDataSource(),
      databaseClient: databaseClient,
    );
    final localStorageManager = LocalStorageManager();
    await localStorageManager.init();
    return App(
      localStorageManager: localStorageManager,
      recipesRepository: recipesRepository,
    );
  });
}
