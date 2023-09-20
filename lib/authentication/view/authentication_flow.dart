import 'package:challenge_bloc/authentication/cubit/authentication_cubit.dart';
import 'package:challenge_bloc/authentication/cubit/authentication_state.dart';
import 'package:challenge_bloc/authentication/routes/routes.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationFlow extends StatelessWidget {
  const AuthenticationFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenticationCubit(),
      child: Builder(
        builder: (context) {
          return FlowBuilder<AuthenticationState>(
            state: context.select((AuthenticationCubit cubit) => cubit.state),
            onGeneratePages: onGenerateAppViewPages,
          );
        },
      ),
    );
  }
}
