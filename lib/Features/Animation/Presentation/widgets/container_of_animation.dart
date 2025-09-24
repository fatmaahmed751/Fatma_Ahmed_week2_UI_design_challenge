import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../Utilites/theme_helper.dart';

class AnimationContainerOfList extends StatefulWidget {
  final String text;
  final int index;
  const AnimationContainerOfList({
    super.key,
    required this.text, required this.index});

  @override
  State<AnimationContainerOfList> createState() =>
      _AnimationContainerOfListState();
}

class _AnimationContainerOfListState extends State<AnimationContainerOfList> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.symmetric(vertical: 4.h),
      child: Container(
        width: 350.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: ThemeClass.of(context).waiting,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 6,
            ),
          ],
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Gap(12.w),
            ReorderableDragStartListener(
              index: widget.index,
              child: const Icon(Icons.menu,
                size: 18,),
            ),
            Gap(8.w),
            Expanded(
              child: Text(
                widget.text,
                style: TextStyle(
                  decoration: value
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.black,
                  decorationThickness: 1,
                ),
              ),
            ),
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                setState(() {
                  value = newValue!;
                });
              },
              activeColor: Colors.purple,
              checkColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
