import 'package:flutter/material.dart';

class LoadingDots extends StatefulWidget {
  const LoadingDots({super.key});

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late List<Animation<double>> _scaleAnimations;
  late List<Animation<double>> _opacityAnimations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    _scaleAnimations = List.generate(3, (index) {
      final start = index * 0.2; // delay
      final end = start + 0.4;   // active window
      return Tween<double>(begin: 0.5, end: 1.2).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeInOut),
        ),
      );
    });

    _opacityAnimations = List.generate(3, (index) {
      final start = index * 0.2;
      final end = start + 0.5;
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeInOut),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return ScaleTransition(
              scale: _scaleAnimations[index],
              child: Opacity(
                opacity: _opacityAnimations[index].value,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}