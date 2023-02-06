// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../animation_constants.dart';
import '../fade_animation/fade_animation_widget.dart';
import '../fade_animation/fade_enum.dart';
import '../scale_animation/scale_animated_widget.dart';
import '../scale_animation/scale_enum.dart';

class FadedScaleAnimationWidget extends StatelessWidget {
  const FadedScaleAnimationWidget({
    Key? key,
    this.duration = AnimationConstants.defaultDuration,
    this.fadeType = AnimationConstants.defaultFade,
    this.scaleType = AnimationConstants.defaultScale,
    this.curve = AnimationConstants.defaultCurve,
    this.initialScaleRatio = 0.4,
    required this.child,
    this.fadeCurve,
    this.scaleCurve,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final FadeType fadeType;
  final ScaleType scaleType;
  final Curve curve;
  final double initialScaleRatio;
  final Curve? fadeCurve;
  final Curve? scaleCurve;

  @override
  Widget build(BuildContext context) {
    return FadeAnimatedWidget(
      duration: duration,
      fadeType: fadeType,
      curve: fadeCurve ?? curve,
      child: ScaleAnimatedWidget(
        duration: duration,
        scaleType: scaleType,
        initialScaleRatio: initialScaleRatio,
        curve: scaleCurve ?? curve,
        child: child,
      ),
    );
  }
}
