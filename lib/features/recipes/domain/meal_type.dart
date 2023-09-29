import 'dart:developer';

import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum MealType {
  breakfast,
  morningSnack,
  lunch,
  snack,
  dinner;

  String toStringValue(AppLocalizations l10n) {
    return switch (this) {
      MealType.breakfast => l10n.breakfast,
      MealType.morningSnack => l10n.morningSnack,
      MealType.lunch => l10n.lunch,
      MealType.snack => l10n.snack,
      MealType.dinner => l10n.dinner
    };
  }

  String imageURL() {
    return switch (this) {
      breakfast => AppImages.desayuno,
      morningSnack => AppImages.colacion,
      lunch => AppImages.almuerzo,
      snack => AppImages.merienda,
      dinner => AppImages.cena,
    };
  }

  static MealType fromJson(String? json) {
    try {
      return MealType.values.firstWhere(
        (element) => element.toRawValue() == json,
      );
    } catch (e) {
      log('error');
      return MealType.breakfast;
    }
  }

  String toRawValue() {
    return switch (this) {
      breakfast => 'breakfast',
      morningSnack => 'morning_snack',
      snack => 'breakfast',
      lunch || dinner => 'meal'
    };
  }

  Color color() {
    return switch (this) {
      MealType.breakfast => AppColors.skyBlue,
      MealType.morningSnack => AppColors.lemon,
      MealType.lunch => AppColors.green,
      MealType.snack => AppColors.blue,
      MealType.dinner => AppColors.peach
    };
  }
}
