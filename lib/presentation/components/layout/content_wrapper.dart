import 'package:flutter/material.dart';
import 'package:profinder/common/theme.dart';

class ContentWrapper extends StatelessWidget {
  final List<Widget> children; // Liste des widgets enfants à afficher

  const ContentWrapper({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(
            wrapperPadding), // Espacement autour du contenu
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Alignement principal en haut
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alignement transversal à gauche
          children: [
            for (var i = 0; i < children.length; i++) ...[
              children[i], // Affiche chaque enfant de la liste

              // Ajoute un espace vertical entre les enfants, sauf pour le dernier
              if (i != children.length - 1) const SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }
}
