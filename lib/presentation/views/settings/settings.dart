import 'package:flutter/material.dart';
import 'package:profinder/presentation/components/layout/content_wrapper.dart';
import 'package:profinder/presentation/components/atoms/title_section.dart';
import 'package:profinder/presentation/views/settings/setting_row.dart'; // Import du widget SettingRow

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: ContentWrapper(
          children: [
            const TitleSection('Settings'), // Section de titre "Settings"
            const SizedBox(height: 25), // Espace vertical fixe de 25 pixels

            // Ligne de paramètre pour les notifications push
            SettingRow(
              title: 'Push Notifications', // Titre de la ligne
              actionWidget: Switch(
                value:
                    false, // Valeur du switch (à remplacer par votre logique pour gérer les notifications)
                onChanged: (newValue) {
                  // Fonction appelée lorsqu'on change la valeur du switch
                  // Implémentez ici la logique pour activer ou désactiver les notifications
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
