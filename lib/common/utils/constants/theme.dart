import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final appThemeData = ThemeData(
    primarySwatch: AppColors.primary,
    fontFamily: 'Gilroy',
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dividerColor: AppColors.grey,
    scaffoldBackgroundColor: AppColors.scaffold,
    // navigationBarTheme: const NavigationBarThemeData(
    //   backgroundColor: Colors.white,
    //   elevation: 4,
    //   iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
    //       (state) => const IconThemeData()),
    // ),
    navigationBarTheme: NavigationBarThemeData(
      height: 45,
      iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
        (state) => const IconThemeData(
          opticalSize: 10,
          color: Colors.red,
          fill: 0.99,
          size: 20,
        ),
      ),
      indicatorColor: Colors.transparent,
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            color: AppColors.accentColor,
            height: 0.5,
          );
        }
        return const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: AppColors.darkGrey,
          height: 0.5,
        );
      }),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 1,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: 'Gilroy',
      ),
      iconTheme: IconThemeData(color: Colors.black), // set icon color to black
    ),
  );
}
