import 'package:flutter/material.dart';

//Base colors
const Color red = Color.fromRGBO(255, 82, 73, 1);
const Color silver = Color.fromRGBO(163, 163, 163, 1);
const Color white = Color.fromRGBO(245, 245, 245, 1);
const Color black = Color.fromRGBO(47, 47, 47, 1);

//Theme colors
const Color contentColor = black;
const Color lightContentColor = silver;
const Color titleColor = red;
const Color highlightColor = red;

const double textSize = 20;
const double titleSize = 30;
const double radius = 10;

const double wrapperPadding = 12.0;

//Fonts
const String robotoFont = 'Roboto';
const String interFont = 'Inter';

TextStyle titleStyle = const TextStyle(
  fontFamily: interFont,
  color: titleColor,
  fontSize: titleSize,
  fontWeight: FontWeight.bold,
);

TextStyle subTitleStyle = const TextStyle(
  fontFamily: interFont,
  color: contentColor,
  fontSize: textSize,
  fontWeight: FontWeight.bold,
);

TextStyle textStyle = const TextStyle(
  fontFamily: robotoFont,
  color: contentColor,
  fontSize: textSize,
  fontWeight: FontWeight.w400,
);

TextStyle buttonStyle = const TextStyle(
  fontFamily: interFont,
  color: contentColor,
  fontSize: textSize,
  fontWeight: FontWeight.w700,
);

InputDecoration inputStyle = InputDecoration(
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
  labelStyle: textStyle.copyWith(color: white),
  fillColor: highlightColor,
  filled: true,
);
