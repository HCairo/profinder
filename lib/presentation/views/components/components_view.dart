import 'package:flutter/material.dart';
import 'package:profinder/presentation/components/layout/content_wrapper.dart';
import 'package:profinder/presentation/components/atoms/title_section.dart';

class ComponentsView extends StatelessWidget {
  const ComponentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Components'),
      ),
      body: ContentWrapper(
        children: [
          const TitleSection('Buttons'),
          _buildButtonExamples(),
          const SizedBox(height: 24.0),
          const TitleSection('Text Fields'),
          _buildTextFieldExamples(),
          // Ajoutez d'autres sections pour les autres composants ici
        ],
      ),
    );
  }

  static Widget _buildButtonExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Elevated Button'),
        ),
        const SizedBox(height: 12.0),
        OutlinedButton(
          onPressed: () {},
          child: const Text('Outlined Button'),
        ),
        const SizedBox(height: 12.0),
        TextButton(
          onPressed: () {},
          child: const Text('Text Button'),
        ),
      ],
    );
  }

  static Widget _buildTextFieldExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'Standard TextField',
            hintText: 'Enter text here',
          ),
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Form TextField',
            hintText: 'Enter text here',
          ),
        ),
      ],
    );
  }
}
