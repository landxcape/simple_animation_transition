import 'package:flutter/material.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

class ScaleAnimatedWidget extends StatefulWidget {
  /// Wrap widget to get a scaling effect.
  /// [initialScaleRatio] is the initial size of the widget (pass value between 0 to 1).
  /// [endScaleRatio] is the end size of the widget (pass value between 0 to 1)
  /// Supplying [initialScaleRatio] and/or [endScaleRatio] will override [ScaleType]
  /// [scaleType] by default is [ScaleType.scaleIn] (as defined in [AnimationConstants]).
  /// [duration] by default is 1500 milliseconds.
  /// [curve] by default is [Curves.fastOutSlowIn].
  const ScaleAnimatedWidget({
    super.key,
    this.scaleType = AnimationConstants.defaultScale,
    this.duration = AnimationConstants.defaultDuration,
    this.curve = AnimationConstants.defaultCurve,
    this.initialScaleRatio,
    this.endScaleRatio,
    required this.child,
  });

  final ScaleType scaleType;
  final Duration duration;
  final Curve curve;
  final double? initialScaleRatio;
  final double? endScaleRatio;
  final Widget child;

  @override
  State<ScaleAnimatedWidget> createState() => _ScaleAnimatedWidgetState();
}

class _ScaleAnimatedWidgetState extends State<ScaleAnimatedWidget>
    with TickerProviderStateMixin {
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
      begin: widget.initialScaleRatio ?? widget.scaleType.getBegin(),
      end: widget.endScaleRatio ?? widget.scaleType.getEnd(),
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
