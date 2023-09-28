import 'package:challenge_bloc/common/utils/constants/colors.dart';
import 'package:challenge_bloc/features/home/home.dart';
import 'package:challenge_bloc/features/home/presentation/widgets/nav_bar_icon.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex =
        context.select((HomeCubit cubit) => cubit.state.status.index);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 5),
        backgroundColor: AppColors.white,
        selectedIndex: selectedIndex,
        destinations: List.generate(
          HomeStatus.values.length,
          (index) => AnimatedNavBarItem(
            key: GlobalKey(),
            index: index,
            selectedIndex: selectedIndex,
          ),
        ),
        onDestinationSelected: (index) =>
            context.read<HomeCubit>().goToPage(index),
      ),
      body: FlowBuilder<HomeState>(
        onGeneratePages: onGenerateNavBarPages,
        state: context.select((HomeCubit cubit) => cubit.state),
      ),
    );
  }
}
