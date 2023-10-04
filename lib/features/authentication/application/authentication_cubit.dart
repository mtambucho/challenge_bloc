import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit()
      : super(const AuthenticationState(status: AuthenticationStatus.loading));

  void login() {
    emit(const AuthenticationState(status: AuthenticationStatus.authenticated));
  }

  void logout() {
    emit(
      const AuthenticationState(
        status: AuthenticationStatus.unauthenticated,
      ),
    );
  }

  Future<void> checkAuthentication() async {
    emit(
      const AuthenticationState(
        status: AuthenticationStatus.authenticated,
      ),
    );
    Future.delayed(
      const Duration(milliseconds: 100),
      FlutterNativeSplash.remove,
    );
  }
}
