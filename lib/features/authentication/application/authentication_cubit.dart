import 'package:challenge_bloc/features/authentication/application/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState.loading);

  void login() {
    emit(AuthenticationState.authenticated);
  }

  void logout() {
    emit(AuthenticationState.unauthenticated);
  }

  void checkAuthentication() {
    Future.delayed(const Duration(seconds: 2), () {
      emit(AuthenticationState.unauthenticated);
    });
  }
}
