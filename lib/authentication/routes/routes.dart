import 'package:challenge_bloc/authentication/authentication.dart';
import 'package:challenge_bloc/home/view/home_page.dart';
import 'package:challenge_bloc/login/login_page.dart';
import 'package:flutter/material.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthenticationState state,
  List<Page<dynamic>> pages,
) {
  return switch (state) {
    AuthenticationState.unauthenticated => [LoginPage.page()],
    AuthenticationState.authenticated => [HomePage.page()],
    AuthenticationState.loading => [SplashPage.page()],
  };
}
