import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../widgets/absorb_pointer.dart';
import '../widgets/custom_context_menu.dart';
import '../widgets/interactive_viewer.dart';



class WidgetsCatalog extends StatelessWidget {
  static const routeName = "widget";

  const WidgetsCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Widgets Catalog")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               CustomContextMenuExample(),
               InteractiveViewerScreen(),
              AdvancedAbsorbPointerExample(),
              Gap(20.h)
            ],
          ),
        ),
      ),
    );
  }
}


