import 'package:flutter/widgets.dart';
import 'package:profinder/common/theme.dart';

enum TextType {
  title,
  subtitle,
  label,
  text
} // Enumération pour différents types de texte

class Customtext extends StatelessWidget {
  final String text; // Le texte à afficher
  final TextType type; // Le type de texte (title, subtitle, label, text)
  final TextAlign? alignment; // Alignement du texte (optionnel)
  final bool? darkBackground; // Fond sombre ou clair (optionnel)

  const Customtext({
    super.key,
    required this.text,
    required this.type,
    this.alignment,
    this.darkBackground,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle style = textStyle; // Style par défaut
    switch (type) {
      case TextType.title:
        style = titleStyle; // Utilise le style de titre
        break;
      case TextType.subtitle:
        style = subTitleStyle; // Utilise le style de sous-titre
        break;
      case TextType.label:
        style = buttonStyle; // Utilise le style de bouton (à clarifier)
        break;
      case TextType.text:
        style = textStyle; // Utilise le style de texte par défaut
        break;
    }

    return Text(
      text, // Texte à afficher
      textAlign: alignment ??
          TextAlign.left, // Alignement du texte, par défaut à gauche
      style: style.copyWith(
        color: darkBackground == true ? lightContentColor : contentColor,
        // Couleur du texte basée sur le fond sombre ou clair
      ),
    );
  }
}
