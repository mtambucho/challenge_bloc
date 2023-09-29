import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:challenge_bloc/features/settings/domain/settings_item.dart';
import 'package:hive/hive.dart';

class HiveService {
  static void registerAdapters() {
    Hive
      ..registerAdapter(CartItemAdapter())
      ..registerAdapter(RecipeAdapter())
      ..registerAdapter(IngredientAdapter())
      ..registerAdapter(SettingsItemAdapter())
      ..registerAdapter(LanguageAdapter());
  }
}
