import 'package:flutter/material.dart';
import 'package:profinder/common/theme.dart';

enum InputType {
  text,
  mail,
  password,
  area,
}

class Input extends StatefulWidget {
  final InputType type;
  final String label;
  final TextEditingController? controller;
  const Input(
      {super.key, required this.type, required this.label, this.controller});

  @override
  State<Input> createState() => InputState();
}

class InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case InputType.text:
        return TextField(
          controller: widget.controller,
          decoration: inputStyle.copyWith(
            labelText: widget.label,
          ),
        );
      case InputType.mail:
        return TextField(
          controller: widget.controller,
          decoration: inputStyle.copyWith(
            labelText: widget.label,
          ),
        );
      case InputType.password:
        return TextField(
          controller: widget.controller,
          decoration: inputStyle.copyWith(
            labelText: widget.label,
          ),
        );
      case InputType.area:
        return Container(
          color: contentColor,
          child: TextField(
            style: textStyle.copyWith(color: lightContentColor),
            textAlign: TextAlign.start,
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            controller: widget.controller,
            decoration: inputStyle,
          ),
        );
    }
  }
}
