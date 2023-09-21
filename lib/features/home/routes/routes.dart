import 'package:challenge_bloc/features/challenge/challenge.dart';
import 'package:challenge_bloc/features/home/home.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:challenge_bloc/features/settings/settings.dart';
import 'package:flutter/material.dart';

List<Page<dynamic>> onGenerateNavBarPages(
  HomeStatus state,
  List<Page<dynamic>> pages,
) {
  return switch (state) {
    HomeStatus.recipes => [RecipesPage.page()],
    // HomeStatus.excercise => [ExcercisePage.page()],
    // HomeStatus.fasting => [FastingPage.page()],
    HomeStatus.settings => [SettingPage.page()],
    HomeStatus.challenge => [ChallengePage.page()],
  };
}