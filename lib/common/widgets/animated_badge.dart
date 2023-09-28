import 'package:flutter/material.dart';

class AnimatedBadge extends StatefulWidget {
  const AnimatedBadge({
    required this.badgeItems,
    required this.icon,
    super.key,
    this.onPressed,
    this.emptyIcon,
  });
  final void Function()? onPressed;
  final int badgeItems;
  final IconData? emptyIcon;
  final IconData icon;

  @override
  State<AnimatedBadge> createState() => AnimatedBadgeState();
}

class AnimatedBadgeState extends State<AnimatedBadge>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
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
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
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
      builder: (_, __) => IconButton(
        onPressed: widget.onPressed,
        icon: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(
                widget.badgeItems > 0
                    ? widget.icon
                    : (widget.emptyIcon ?? widget.icon),
              ),
            ),
            if (widget.badgeItems > 0)
              Positioned(
                right: -2,
                top: -2 - (1 - _animation.value) * 10,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    widget.badgeItems.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
