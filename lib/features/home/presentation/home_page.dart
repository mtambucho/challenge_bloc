import 'package:challenge_bloc/common/services/dynamic_link/dynamic_link.dart';
import 'package:challenge_bloc/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) =>
              DeepLinkCubit(context.read<FirebaseDeepLinkRepository>()),
        ),
      ],
      child: BlocListener<DeepLinkCubit, DeepLinkState>(
        listener: (context, state) {
          if (state is LinkPending) {
            final redirect = state.link;
            if (redirect.event == DeepLinkRedirectEvent.recipeDetails) {
              context.read<HomeCubit>().redirectToDetails(redirect);
            }
          }
        },
        child: const HomeView(),
      ),
    );
  }
}
