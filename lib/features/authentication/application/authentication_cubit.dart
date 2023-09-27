import 'package:challenge_bloc/features/authentication/application/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState.loading);

  void login() {
    emit(AuthenticationState.authenticated);
  }

  void logout() {
    emit(AuthenticationState.unauthenticated);
  }

  void checkAuthentication() {
    emit(AuthenticationState.authenticated);
    Future.delayed(
      const Duration(milliseconds: 100),
      FlutterNativeSplash.remove,
    );
  }
}
