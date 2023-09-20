import 'package:challenge_bloc/authentication/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage._();

  static Page<void> page() => const MaterialPage<void>(child: SplashPage._());

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    context.read<AuthenticationCubit>().checkAuthentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Splash'),
          ],
        ),
      ),
    );
  }
}
