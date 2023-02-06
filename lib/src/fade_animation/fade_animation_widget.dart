import 'package:flutter/material.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';


class FadeAnimatedWidget extends StatefulWidget {
/// Wrap widget to get a faded effect.
  /// [fadeType] by default is [FadeType.fadeIn] (as defined in [AnimationConstants]).
  /// [duration] by default is 1500 milliseconds.
  /// [curve] by default is [Curves.fastOutSlowIn].
  const FadeAnimatedWidget({
    super.key,
    this.fadeType = AnimationConstants.defaultFade,
    this.duration = AnimationConstants.defaultDuration,
    this.curve = AnimationConstants.defaultCurve,
    required this.child,
  });

  final FadeType fadeType;
  final Duration duration;
  final Curve curve;
  final Widget child;

  @override
  State<FadeAnimatedWidget> createState() => _FadeAnimatedWidgetState();
}

class _FadeAnimatedWidgetState extends State<FadeAnimatedWidget> with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: widget.fadeType.getBegin(),
      end: widget.fadeType.getEnd(),
    ).animate(CurvedAnimation(parent: _fadeController, curve: widget.curve));

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.reverse();

    _fadeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: widget.child,
    );
  }
}
