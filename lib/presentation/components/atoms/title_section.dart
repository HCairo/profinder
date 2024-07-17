import 'package:flutter/material.dart';
import 'package:profinder/common/theme.dart';
import 'package:profinder/presentation/components/atoms/custom_text.dart';

class TitleSection extends StatelessWidget implements PreferredSizeWidget {
  const TitleSection(this.text, {super.key});

  final String text;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    // return a text with a little line below it
    // container with text and line with absolute position ing
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customtext(text: text, type: TextType.title),
        const SizedBox(height: 10),
        Container(
          height: 4,
          width: 100,
          decoration: BoxDecoration(
            color: contentColor,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ],
    );
  }
}
