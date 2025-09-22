import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home/widgets/bottom_navbar_widget.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName='settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBarWidget(
        selected: SelectedBottomNavBar.settings,
      ),
    );
  }
}