import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../widgets/dots_animation.dart';
import '../widgets/dragable_animation.dart';
import '../widgets/list_of_container_animation.dart';

class AnimationScreen extends StatefulWidget {
  static const routeName = "animation";
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Gap(60.h),
              SizedBox(height: 250.h, child: AnimationList()),
              Gap(10.h),
              LoadingDots(),
              Spacer(),
              DragDropDemo()
            ],
          ),
        ),
      ),
    );
  }
}







