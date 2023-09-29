import 'package:challenge_bloc/common/utils.dart';
import 'package:flutter/material.dart';

enum RecipePortionsChange { add, remove, defaultPortions }

class RecipeDetailsIcons extends StatelessWidget {
  const RecipeDetailsIcons({
    required this.portions,
    required this.onChange,
    super.key,
  });
  final int portions;
  final void Function(RecipePortionsChange) onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              icon: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.arrow_left, size: 15),
              ),
              onPressed: () => onChange(RecipePortionsChange.remove),
            ),
          ),
          GestureDetector(
            onTap: () => onChange(RecipePortionsChange.defaultPortions),
            child: _Icon(
              icon: Icons.restaurant_sharp,
              text: context.l10n.portions(portions),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              icon: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.arrow_right,
                  size: 15,
                ),
              ),
              onPressed: () => onChange(RecipePortionsChange.add),
            ),
          ),
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.black, size: 30),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
