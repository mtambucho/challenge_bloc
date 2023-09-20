import 'package:challenge_bloc/authentication/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage._();

  static Page<void> page() => const MaterialPage<void>(child: LoginPage._());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Sign In'),
              onPressed: () {
                context.read<AuthenticationCubit>().login();
              },
            ),
          ],
        ),
      ),
    );
  }
}
