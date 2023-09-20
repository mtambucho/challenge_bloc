import 'package:challenge_bloc/home/home.dart';
import 'package:challenge_bloc/home/routes/routes.dart';
import 'package:challenge_bloc/l10n/l10n.dart';
import 'package:challenge_bloc/utils/constants/colors.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex =
        context.select((HomeCubit cubit) => cubit.state.status.index);
    final l10n = context.l10n;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.white,
        selectedIndex: selectedIndex,
        destinations: List.generate(
          HomeStatus.enabledValues.length,
          (index) => NavigationDestination(
            label: HomeStatus.enabledValues[index].toStringValue(l10n),
            icon: Image.asset(
              HomeStatus.enabledValues[index].icon,
              height: 20,
              fit: BoxFit.fitHeight,
              colorBlendMode: BlendMode.srcIn,
              color: selectedIndex == index ? AppColors.accentColor : null,
            ),
          ),
        ),
        onDestinationSelected: (index) =>
            context.read<HomeCubit>().goToPage(index),
      ),
      body: FlowBuilder<HomeStatus>(
        onGeneratePages: onGenerateNavBarPages,
        state: context.select((HomeCubit cubit) => cubit.state.status),
      ),
    );
  }
}
