import 'dart:convert';

import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManager {
  late final SharedPreferences manager;

  Future<void> init() async {
    manager = await SharedPreferences.getInstance();
  }

  static const hasSignedIn = 'hasSignedIn';

  Future<bool> write<T>({
    required String key,
    required T value,
  }) async {
    var isValueStored = false;
    switch (T) {
      case String:
        isValueStored = await manager.setString(key, value as String);
      case bool:
        isValueStored = await manager.setBool(key, value as bool);
      case int:
        isValueStored = await manager.setInt(key, value as int);
      default:
        final jsonValue = json.encode(value);
        isValueStored = await manager.setString(key, jsonValue);
        break;
    }
    return isValueStored;
  }

  T? read<T>({
    required String key,
  }) {
    switch (T) {
      case String:
        return manager.getString(key) as T?;
      case bool:
        return manager.getBool(key) as T?;
      case int:
        return manager.getInt(key) as T?;
    }
    return null;
  }

  ///save the cart list in the local storage
  void saveCartList(List<CartItem> item) {
    final List<dynamic> encodedJson =
        item.map((dayMeals) => dayMeals.toJson()).toList();
    write(key: 'cart', value: encodedJson);
  }

  ///get the cart list from the local storage
  List<CartItem> getCartList() {
    final jsonStr = read<String>(key: 'cart');
    if (jsonStr == null) {
      return [];
    }
    final decodedJson = json.decode(jsonStr) as List;
    return decodedJson
        .map((json) => CartItem.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  // ///save List<WeekMeals> meals
  // void saveWeeksRecipes(List<DayMeals> meals) {
  //   final List<dynamic> encodedJson =
  //       meals.map((dayMeals) => dayMeals.toJson()).toList();
  //   write(key: 'meals', value: encodedJson);
  // }

  // ///get List<WeekMeals> meals
  // List<DayMeals> getWeeksRecipes() {
  //   final jsonStr = read<String>(key: 'meals');
  //   if (jsonStr == null) {
  //     return [];
  //   }
  //   final List<dynamic> decodedJson = json.decode(jsonStr);
  //   return decodedJson.map(DayMeals.fromJson).toList();
  // }

  // ///save the starting date of the week
  // Preferences getPreferences() {
  //   final jsonStr = read<String>(key: 'preferences');
  //   if (jsonStr == null) {
  //     return Preferences(DateTime(2023, 7, 3));
  //   }
  //   return Preferences.fromJson(json.decode(jsonStr));
  // }

  // void saveStartupPage(String startupPage) {
  //   write(key: 'startup_page', value: startupPage);
  // }

  // String getStartupPage() {
  //   return read<String>(key: 'startup_page') ?? Routes.defaultPage;
  // }

  // ///get the starting date of the week
  // void savePreferences(Preferences preferences) {
  //   write(key: 'preferences', value: preferences.toJson());
  // }

  ///save the favorites recipes
  List<Recipe> getFavorites() {
    final jsonStr = read<String>(key: 'favorites');
    if (jsonStr == null) {
      return [];
    }
    final decodedJson = json.decode(jsonStr) as List?;
    return decodedJson
            ?.map((json) => Recipe.fromJson(json as Map<String, dynamic>))
            .toList() ??
        [];
  }

  ///save the favorites recipes
  void saveFavorite(Recipe recipe) {
    final fav = getFavorites()..add(recipe);
    final List<dynamic> encodedJson = fav.map((f) => f.toJson()).toList();
    write(key: 'favorites', value: encodedJson);
  }

  ///remove the favorites recipes
  void removeFavorite(Recipe recipe) {
    final fav = getFavorites()..remove(recipe);
    final List<dynamic> encodedJson = fav.map((f) => f.toJson()).toList();
    write(key: 'favorites', value: encodedJson);
  }
}
