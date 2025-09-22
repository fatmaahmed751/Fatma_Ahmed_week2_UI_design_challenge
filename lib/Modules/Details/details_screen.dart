import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home/widgets/bottom_navbar_widget.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName='details';
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBarWidget(
        selected: SelectedBottomNavBar.details,
      ),
    );
  }
}
