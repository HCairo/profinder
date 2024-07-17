import 'package:flutter/material.dart';
import 'package:profinder/common/theme.dart';
import 'package:profinder/presentation/components/atoms/custom_text.dart';

class TitleSection extends StatelessWidget implements PreferredSizeWidget {
  const TitleSection(this.text, {super.key});

  final String text; // Texte à afficher dans la section de titre

  @override
  Size get preferredSize =>
      const Size.fromHeight(60); // Taille préférée de la section

  @override
  Widget build(BuildContext context) {
    // Retourne une colonne contenant le texte et une ligne en dessous

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Alignement du contenu à gauche
      children: [
        Customtext(
            text: text,
            type: TextType.title), // Utilise le texte en tant que titre
        const SizedBox(height: 10), // Espace vertical de 10 pixels
        Container(
          height: 4, // Hauteur de la ligne
          width: 100, // Largeur de la ligne
          decoration: BoxDecoration(
            color: contentColor, // Couleur de la ligne
            borderRadius:
                BorderRadius.circular(radius), // Bord arrondi de la ligne
          ),
        ),
      ],
    );
  }
}
