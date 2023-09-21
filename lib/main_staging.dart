import 'package:challenge_bloc/app/app.dart';
import 'package:challenge_bloc/bootstrap.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/authentication/infrastructure/recipes_datasource_impl.dart';
import 'package:challenge_bloc/features/authentication/infrastructure/recipes_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/.env');

  await bootstrap(() {
    final RecipesRepository recipesRepository = RecipesRepositoryImpl(
      dataSource: RecipesDataSourceImpl(),
    );
    return App(recipesRepository: recipesRepository);
  });
}
