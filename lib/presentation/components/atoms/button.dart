import 'package:flutter/material.dart';
import 'package:profinder/common/theme.dart';
import 'package:profinder/presentation/components/atoms/custom_text.dart';

class Button extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool isLoading;

  const Button({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? const CircularProgressIndicator()
                : Customtext(
                    text: text.toUpperCase(),
                    type: TextType.label,
                    darkBackground: true,
                  )
          ],
        ),
      ),
    );
  }
}
