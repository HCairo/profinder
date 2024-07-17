import 'package:flutter/material.dart';
import 'package:profinder/presentation/components/atoms/title_section.dart';

class SettingRow extends StatelessWidget {
  final String title; // Titre de la ligne de configuration
  final Widget actionWidget; // Widget d'action à afficher à droite

  const SettingRow({
    super.key,
    required this.title,
    required this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0), // Espacement vertical autour de la ligne
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // Alignement des éléments de la ligne
        children: [
          TitleSection(
              title), // Affiche le titre à gauche de la ligne en utilisant le widget TitleSection
          const SizedBox(
              width:
                  16), // Espace fixe horizontal entre le titre et le widget d'action
          Expanded(
            child: Align(
              alignment: Alignment
                  .centerRight, // Alignement du widget d'action à droite
              child: actionWidget, // Affiche le widget d'action fourni
            ),
          ),
        ],
      ),
    );
  }
}
