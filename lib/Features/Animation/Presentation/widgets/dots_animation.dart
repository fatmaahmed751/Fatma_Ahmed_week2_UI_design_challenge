import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoadingDots extends StatefulWidget {
  const LoadingDots({super.key});

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots> {
  int currentIndex = -1;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer = Timer.periodic(const Duration(milliseconds: 400), (t) {
        if (currentIndex < 2) {
          setState(() {
            currentIndex++;
          });
        } else {
          currentIndex = -1;
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        bool isActive = index <= currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          margin:  EdgeInsets.symmetric(horizontal:isActive?0.w:6.w),
          width: isActive ? 18 : 6,
          height: isActive ? 18 : 6,
          decoration: BoxDecoration(
            color:isActive? Colors.blue:Colors.blue[200],
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}