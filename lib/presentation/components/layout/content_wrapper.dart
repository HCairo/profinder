import 'package:flutter/material.dart';
import 'package:profinder/common/theme.dart';

class ContentWrapper extends StatelessWidget {
  final List<Widget> children;
  const ContentWrapper({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(wrapperPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < children.length; i++) ...[
              children[i],
              if (i != children.length - 1) const SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }
}
