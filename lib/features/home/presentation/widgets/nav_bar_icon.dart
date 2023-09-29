import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/features/home/home.dart';
import 'package:flutter/material.dart';

class AnimatedNavBarItem extends StatefulWidget {
  const AnimatedNavBarItem({
    required this.index,
    required this.selectedIndex,
    super.key,
  });
  final int index;
  final int selectedIndex;
  @override
  State<AnimatedNavBarItem> createState() => _AnimatedNavBarItemState();
}

class _AnimatedNavBarItemState extends State<AnimatedNavBarItem>
    with TickerProviderStateMixin {
  int get index => widget.index;
  int get selectedIndex => widget.selectedIndex;
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
      value: 0,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
    if (selectedIndex == index) {
      _controller.forward().then((value) => _controller.reverse());
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Theme(
          data: AppTheme.appThemeData.copyWith(
            navigationBarTheme: NavigationBarThemeData(
              height: 45,
              indicatorColor: Colors.transparent,
              labelTextStyle: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return TextStyle(
                    fontSize: 9 + (2 * _animation.value),
                    fontWeight: FontWeight.w700,
                    color: AppColors.accentColor,
                    height: 0.5,
                  );
                }
                return const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkGrey,
                  height: 0.5,
                );
              }),
            ),
          ),
          child: NavigationDestination(
            label: HomeStatus.values[index].toStringValue(context.l10n),
            icon: Image.asset(
              HomeStatus.values[index].icon,
              height: 20 + (5 * _animation.value),
              fit: BoxFit.fitHeight,
              colorBlendMode: BlendMode.srcIn,
              color: selectedIndex == index ? AppColors.accentColor : null,
            ),
          ),
        );
      },
    );
  }
}
