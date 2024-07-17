import 'package:flutter/material.dart';
import 'package:profinder/presentation/views/pros/pros_screen.dart';
import 'package:profinder/presentation/views/settings/settings.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _navIndex = 0;

  final Map<int, Widget> _bodyViews = {
    0: ProsView(),
    // ignore: prefer_const_constructors
    1: SettingsScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: getBodyViewByIndex(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => navigationTap(value),
        currentIndex: _navIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Pros',
            icon: Icon(Icons.rate_review),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }

  Widget getBodyViewByIndex() {
    return _bodyViews[_navIndex] ??
        Container(
          color: Colors.red,
          child: const Text('Error'),
        );
  }

  void navigationTap(int value) {
    setState(() {
      _navIndex = value;
    });
  }
}
