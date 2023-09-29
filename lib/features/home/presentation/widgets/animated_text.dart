import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/features/home/home.dart';
import 'package:flutter/widgets.dart';

class NavBarIcon extends StatefulWidget {
  const NavBarIcon({
    required this.index,
    required this.selectedIndex,
    super.key,
  });
  final int index;
  final int selectedIndex;
  @override
  State<NavBarIcon> createState() => _NavBarIconState();
}

class _NavBarIconState extends State<NavBarIcon> with TickerProviderStateMixin {
  int get index => widget.index;
  int get selectedIndex => widget.selectedIndex;
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
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
        return Image.asset(
          HomeStatus.values[index].icon,
          height: 20 + (5 * _animation.value),
          fit: BoxFit.fitHeight,
          colorBlendMode: BlendMode.srcIn,
          color: selectedIndex == index ? AppColors.accentColor : null,
        );
      },
    );
  }
}
