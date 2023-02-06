import 'package:flutter/material.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';


class ScaleAnimatedWidget extends StatefulWidget {
  const ScaleAnimatedWidget({
    super.key,
    this.scaleType = AnimationConstants.defaultScale,
    this.duration = AnimationConstants.defaultDuration,
    this.curve = AnimationConstants.defaultCurve,
    this.initialScaleRatio = 0.4,
    required this.child,
  });

  final ScaleType scaleType;
  final Duration duration;
  final Curve curve;
  final Widget child;
  final double initialScaleRatio;

  @override
  State<ScaleAnimatedWidget> createState() => _ScaleAnimatedWidgetState();
}

class _ScaleAnimatedWidgetState extends State<ScaleAnimatedWidget> with TickerProviderStateMixin {
  late final AnimationController _scaleController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: widget.initialScaleRatio,
      end: 1,
    ).animate(CurvedAnimation(parent: _scaleController, curve: widget.curve));

    _scaleController.forward();
  }

  @override
  void dispose() {
    _scaleController.reverse();

    _scaleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}
