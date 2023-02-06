import 'package:flutter/material.dart';

import '../animation_constants.dart';
import 'fade_enum.dart';

class FadeAnimatedWidget extends StatefulWidget {
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
      begin: 0.0,
      end: 1,
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
