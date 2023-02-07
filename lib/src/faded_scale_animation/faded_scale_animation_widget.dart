// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

class FadedScaleAnimationWidget extends StatelessWidget {
  /// mix of [FadeAnimatedWidget] and [ScaleAnimatedWidget]
  const FadedScaleAnimationWidget({
    Key? key,
    this.duration = AnimationConstants.defaultDuration,
    this.fadeType = AnimationConstants.defaultFade,
    this.scaleType = AnimationConstants.defaultScale,
    this.curve = AnimationConstants.defaultCurve,
    this.fadeCurve,
    this.scaleCurve,
    this.initialScaleRatio,
    this.endScaleRatio,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final FadeType fadeType;
  final ScaleType scaleType;
  final Curve curve;
  final double? initialScaleRatio;
  final double? endScaleRatio;
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
        endScaleRatio: endScaleRatio,
        curve: scaleCurve ?? curve,
        child: child,
      ),
    );
  }
}
