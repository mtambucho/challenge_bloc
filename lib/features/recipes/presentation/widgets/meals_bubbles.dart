import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';

class MealsBubbles extends StatelessWidget {
  const MealsBubbles({
    required this.onSelected,
    required this.selected,
    required this.canChangeCategory,
    super.key,
  });
  final void Function(MealType) onSelected;
  final MealType selected;
  final bool canChangeCategory;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        MealType.values.length,
        (index) => _Item(
          index: index,
          size: width / MealType.values.length,
          image: MealType.values[index].imageURL(),
          text: MealType.values[index].toStringValue(l10n),
          onTap: canChangeCategory
              ? () => onSelected.call(MealType.values[index])
              : null,
          isSelected: selected.index == index,
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.index,
    required this.image,
    required this.text,
    required this.onTap,
    required this.size,
    required this.isSelected,
  });
  final int index;
  final String image;
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        key: Key('mealTypeBubble_$index'),
        width: size,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image,
                // width: size - 16,
                height: size - 16,
                fit: BoxFit.fill,
                color: isSelected ? null : AppColors.darkGrey,
              ),
              Text(
                text,
                style: TextStyle(
                  color: isSelected ? null : AppColors.darkGrey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
