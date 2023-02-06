// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

class FadedSlideAnimationWidget extends StatelessWidget {
  /// mix of [FadeAnimatedWidget] and [SlideAnimatedWidget]
  const FadedSlideAnimationWidget({
    Key? key,
    this.duration = AnimationConstants.defaultDuration,
    this.fadeType = AnimationConstants.defaultFade,
    this.direction = AnimationConstants.defaultSlide,
    this.curve = AnimationConstants.defaultCurve,
    this.offset,
    this.fadeCurve,
    this.slideCurve,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final FadeType fadeType;
  final Offset? offset;
  final SlideDirectionType direction;
  final Curve curve;
  final Curve? fadeCurve;
  final Curve? slideCurve;

  @override
  Widget build(BuildContext context) {
    return FadeAnimatedWidget(
      duration: duration,
      fadeType: fadeType,
      curve: fadeCurve ?? curve,
      child: SlideAnimatedWidget(
        duration: duration,
        direction: direction,
        curve: slideCurve ?? curve,
        offset: offset,
        child: child,
      ),
    );
  }
}
