
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DragDropDemo extends StatefulWidget {
  const DragDropDemo({super.key});

  @override
  State<DragDropDemo> createState() => _DragDropDemoState();
}

class _DragDropDemoState extends State<DragDropDemo> {
  final Map<Color, bool> _accepted = {
    Colors.red: false,
    Colors.blue: false,
    Colors.green: false,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 70.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Wrap(
            spacing: 80,
            children: [
              _buildDraggableItem(Colors.red),
              _buildDraggableItem(Colors.blue),
              _buildDraggableItem(Colors.green),
            ],
          ),
          Gap(160.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTargetBox(Colors.red, key: const ValueKey("red")),
              _buildTargetBox(Colors.blue, key: const ValueKey("blue")),
              _buildTargetBox(Colors.green, key: const ValueKey("green")),
            ],

          ),
        ],
      ),
    );
  }

  Widget _buildTargetBox(Color targetColor, {Key? key}) {
    return DragTarget<Color>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: targetColor == Colors.red
                ? targetColor
                : targetColor.withOpacity(0.2),
            border: Border.all(color: targetColor, width: 2.5),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: _accepted[targetColor] == true
              ? const Icon(Icons.check, color: Colors.white, size: 30)
              : null,
        );
      },
      onWillAccept: (data) => true,
      onAccept: (data) {
        if (data == targetColor) {
          setState(() {
            _accepted[targetColor] = true;
          });
        }
      },
    );
  }

  Widget _buildDraggableItem(Color color) {
    return Draggable<Color>(
      data: color,
      feedback: Container(
        width: 40.w,
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: color,
          //color: color.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      childWhenDragging: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: color.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }
}