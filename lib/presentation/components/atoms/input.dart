import 'package:flutter/material.dart';
import 'package:profinder/common/theme.dart';

enum InputType {
  text, // Champ de texte simple
  mail, // Champ pour adresse email
  password, // Champ pour mot de passe
  area, // Zone de texte multi-lignes
}

class Input extends StatefulWidget {
  final InputType type; // Type de champ à afficher
  final String label; // Libellé du champ
  final TextEditingController?
      controller; // Contrôleur pour gérer les données du champ
  const Input({
    super.key,
    required this.type,
    required this.label,
    this.controller,
  });

  @override
  State<Input> createState() => InputState(); // Crée l'état du widget Input
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
          color: contentColor, // Couleur de fond de la zone de texte
          child: TextField(
            style: textStyle.copyWith(
                color: lightContentColor), // Style du texte dans la zone
            textAlign: TextAlign.start, // Alignement du texte
            keyboardType: TextInputType
                .multiline, // Type de clavier pour permettre plusieurs lignes
            maxLines: 4, // Nombre maximum de lignes affichées
            controller: widget.controller, // Contrôleur du champ
            decoration: inputStyle, // Style de décoration du champ
          ),
        );
      default:
        return Container(); // Par défaut, retourne un conteneur vide (peut être personnalisé)
    }
  }
}
