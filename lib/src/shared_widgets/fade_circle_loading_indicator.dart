import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:kroot_app/src/theme/app_colors.dart';

class FadeCircleLoadingIndicator extends StatefulWidget {
  const FadeCircleLoadingIndicator({super.key, this.color});

  final Color? color;

  @override
  State<FadeCircleLoadingIndicator> createState() =>
      _FadeCircleLoadingIndicatorState();
}

class _FadeCircleLoadingIndicatorState extends State<FadeCircleLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _circleSize = 30;
  double _circleOpacity = 1;
  late double _maxCircleSize;

  @override
  void initState() {
    _maxCircleSize = widget.color != null ? 40 : 60;
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {
          _circleSize = _maxCircleSize * _animation.value;
          _circleOpacity = math.max(0, 1 - 2 * _animation.value);
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Center(
        child: Opacity(
          opacity: widget.color != null ? 1 : _circleOpacity,
          child: Container(
            width: _circleSize,
            height: _circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color ?? AppColors.primary,
              // color: widget.color ?? Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
