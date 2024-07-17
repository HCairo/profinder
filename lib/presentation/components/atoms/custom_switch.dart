import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value; // Valeur actuelle du switch (true/false)

  // Constructeur de la classe CustomSwitch
  const CustomSwitch(
      {super.key, required this.value}); // Paramètre obligatoire 'value'

  @override
  Widget build(BuildContext context) {
    return Switch(
      // Widget Switch de Flutter
      value: value, // Utilise la valeur passée au constructeur
      activeColor: Colors.red, // Couleur quand le switch est activé
      onChanged:
          null, // La fonction onChanged est null, donc le switch est désactivé
    );
  }
}
