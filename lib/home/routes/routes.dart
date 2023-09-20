import 'package:challenge_bloc/challenge/challenge.dart';
import 'package:challenge_bloc/excercise/excercise.dart';
import 'package:challenge_bloc/fasting/fasting.dart';
import 'package:challenge_bloc/home/home.dart';
import 'package:challenge_bloc/recipes/recipes.dart';
import 'package:challenge_bloc/settings/settings.dart';
import 'package:flutter/material.dart';

List<Page<dynamic>> onGenerateNavBarPages(
  HomeStatus state,
  List<Page<dynamic>> pages,
) {
  return switch (state) {
    HomeStatus.recipes => [RecipesPage.page()],
    HomeStatus.excercise => [ExcercisePage.page()],
    HomeStatus.fasting => [FastingPage.page()],
    HomeStatus.settings => [SettingPage.page()],
    HomeStatus.challenge => [ChallengePage.page()],
  };
}
