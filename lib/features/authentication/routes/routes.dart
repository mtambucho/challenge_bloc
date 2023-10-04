import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/home/home.dart';
import 'package:challenge_bloc/features/login/login_page.dart';
import 'package:flutter/material.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthenticationState state,
  List<Page<dynamic>> pages,
) {
  return switch (state.status) {
    AuthenticationStatus.unauthenticated => [LoginPage.page()],
    AuthenticationStatus.authenticated => [HomePage.page()],
    AuthenticationStatus.loading => [SplashPage.page()],
  };
}
