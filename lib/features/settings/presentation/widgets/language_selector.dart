import 'package:challenge_bloc/common/utils.dart';
import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({required this.onLanguageSelected, super.key});
  final void Function(Language) onLanguageSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text(
              context.l10n.language,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          const Divider(),
          ...List.generate(
            Language.values.length,
            (index) {
              {
                final item = Language.values[index];
                return Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.language),
                      title: Text(item.languageString(context.l10n)),
                      onTap: () {
                        onLanguageSelected.call(item);
                        Navigator.pop(context);
                      },
                    ),
                    const Divider(),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
