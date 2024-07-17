import 'package:flutter/material.dart';
import 'package:profinder/presentation/components/atoms/title_section.dart';

class SettingRow extends StatelessWidget {
  final String title;
  final Widget actionWidget;

  const SettingRow({
    super.key,
    required this.title,
    required this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleSection(title),
          const SizedBox(width: 16),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: actionWidget,
            ),
          ),
        ],
      ),
    );
  }
}
