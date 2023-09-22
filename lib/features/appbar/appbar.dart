import 'package:challenge_bloc/common/utils/constants/colors.dart';
import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:challenge_bloc/features/fav/presentation/fav_star_widget.dart';
import 'package:flutter/material.dart';

///create a custom app bar to reuse in the hole application
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.titleImage,
    this.actions,
    this.leading,
    this.showFav = false,
  });

  final String? title;
  final String? titleImage;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showFav;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(brightness: Brightness.light),
      child: AppBar(
        elevation: 0,
        backgroundColor: AppColors.scaffold,
        title: title != null
            ? titleImage != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        titleImage!,
                        height: 40,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        title!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  )
                : Text(
                    title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  )
            : null,
        actions: [
          ...?actions,
          if (showFav) const FavStarWidget(),
          const CartWidget(),
        ],
        leading: leading,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
