// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../animation_constants.dart';
import '../fade_animation/fade_animation_widget.dart';
import '../fade_animation/fade_enum.dart';
import '../slide_animation/slide_animated_widget.dart';
import '../slide_animation/slide_direction_enum.dart';

class FadedSlideAnimationWidget extends StatelessWidget {
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
