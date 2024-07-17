import 'package:flutter/material.dart';
import 'package:profinder/presentation/components/layout/content_wrapper.dart';
import 'package:profinder/presentation/components/atoms/title_section.dart';
import 'package:profinder/presentation/views/settings/setting_row.dart'; // Import the new SettingRow widget

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
            const TitleSection('Settings'),
            const SizedBox(height: 25),
            SettingRow(
              title: 'Push Notifications',
              actionWidget: Switch(
                value:
                    false, // Replace with your logic for managing notifications
                onChanged: (newValue) {
                  // Implement logic to toggle notifications
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
