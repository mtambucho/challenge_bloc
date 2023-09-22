import 'package:challenge_bloc/features/recipe_details/recipe_details.dart';
import 'package:flutter/material.dart';

class RecipeDetailsSection extends StatelessWidget {
  const RecipeDetailsSection({
    required this.title,
    required this.items,
    super.key,
  });
  final String title;
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: RecipeDetailsStyles.sectionTitleStyle,
        ),
        const SizedBox(height: 8),
        ...List.generate(
          items.length,
          (index) => _Items(
            item: items[index],
            isFirstItem: index == 0,
            isLastItem: index == items.length - 1,
          ),
        ),
      ],
    );
  }
}

class _Items extends StatelessWidget {
  const _Items({
    required this.item,
    required this.isFirstItem,
    required this.isLastItem,
  });
  final String item;
  final bool isFirstItem;
  final bool isLastItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.2),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: isFirstItem ? const Radius.circular(8) : Radius.zero,
            topRight: isFirstItem ? const Radius.circular(8) : Radius.zero,
            bottomLeft: isLastItem ? const Radius.circular(8) : Radius.zero,
            bottomRight: isLastItem ? const Radius.circular(8) : Radius.zero,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              item,
              style: RecipeDetailsStyles.sectionTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
