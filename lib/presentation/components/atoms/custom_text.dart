import 'package:flutter/widgets.dart';
import 'package:profinder/common/theme.dart';

enum TextType { title, subtitle, label, text }

class Customtext extends StatelessWidget {
  final String text;
  final TextType type;
  final TextAlign? alignment;
  final bool? darkBackground;

  const Customtext(
      {super.key,
      required this.text,
      required this.type,
      this.alignment,
      this.darkBackground});

  @override
  Widget build(BuildContext context) {
    TextStyle style = textStyle;
    switch (type) {
      case TextType.title:
        style = titleStyle;
        break;
      case TextType.subtitle:
        style = subTitleStyle;
        break;
      case TextType.label:
        style = buttonStyle;
        break;
      case TextType.text:
        style = textStyle;
        break;
    }

    return Text(
      textAlign: alignment == null ? null : TextAlign.left,
      text,
      style: style.copyWith(
          color: darkBackground == true ? lightContentColor : contentColor),
    );
  }
}
